@implementation ImageCaptionSettingsViewController

- (void)viewDidLoad
{
  _TtC16MagnifierSupport34ImageCaptionSettingsViewController *v2;

  v2 = self;
  sub_227428200();

}

- (void)viewWillAppear:(BOOL)a3
{
  _TtC16MagnifierSupport34ImageCaptionSettingsViewController *v4;

  v4 = self;
  sub_227428818(a3);

}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (_TtC16MagnifierSupport34ImageCaptionSettingsViewController)initWithNibName:(id)a3 bundle:(id)a4
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
  return (_TtC16MagnifierSupport34ImageCaptionSettingsViewController *)sub_2274289C8(v5, v7, a4);
}

- (_TtC16MagnifierSupport34ImageCaptionSettingsViewController)initWithCoder:(id)a3
{
  return (_TtC16MagnifierSupport34ImageCaptionSettingsViewController *)sub_227428BA4(a3);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport34ImageCaptionSettingsViewController_tableView));
  swift_release();
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  if (a4)
    return 0;
  else
    return (*(_QWORD **)((char *)&self->super.super.super.isa
                       + OBJC_IVAR____TtC16MagnifierSupport34ImageCaptionSettingsViewController_availableImageCaptionFeedbacks))[2];
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
  _TtC16MagnifierSupport34ImageCaptionSettingsViewController *v15;
  id v16;
  uint64_t v18;

  v6 = sub_22758CAD4();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6, v8, v9, v10, v11);
  v13 = (char *)&v18 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22758CA80();
  v14 = a3;
  v15 = self;
  v16 = sub_227428D9C(v14);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v13, v6);
  return v16;
}

- (void)didToggleFeedbackSwitch:(id)a3
{
  id v4;
  _TtC16MagnifierSupport34ImageCaptionSettingsViewController *v5;

  v4 = a3;
  v5 = self;
  sub_227429690(v4);

}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  return sub_227429198((uint64_t)self, (uint64_t)a2, (uint64_t)a3, a4, (void (*)(void))sub_2274294B8);
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  return sub_227429198((uint64_t)self, (uint64_t)a2, (uint64_t)a3, a4, (void (*)(void))sub_2274295A4);
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
  BOOL v12;
  uint64_t v14;

  v4 = sub_22758CAD4();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4, v6, v7, v8, v9);
  v11 = (char *)&v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22758CA80();
  v12 = sub_22758CAC8() != 0;
  (*(void (**)(char *, uint64_t))(v5 + 8))(v11, v4);
  return v12;
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
  _TtC16MagnifierSupport34ImageCaptionSettingsViewController *v15;
  void *v16;
  uint64_t v17;

  v6 = sub_22758CAD4();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6, v8, v9, v10, v11);
  v13 = (char *)&v17 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22758CA80();
  v14 = a3;
  v15 = self;
  v16 = (void *)sub_22758CA74();
  objc_msgSend(v14, sel_deselectRowAtIndexPath_animated_, v16, 1);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v13, v6);
}

@end
