@implementation SFSiriLinkCoordinator

- (id)changeReaderModeInteraction
{
  uint64_t v3;
  uint64_t v4;
  id v5;
  SFSiriLinkCoordinator *v6;
  void *v7;

  v3 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v4 = swift_allocObject();
  *(_QWORD *)(v4 + 16) = &unk_1EDFE95E8;
  *(_QWORD *)(v4 + 24) = v3;
  v5 = objc_allocWithZone((Class)sub_18BAC02D4());
  sub_18B895F5C();
  v6 = self;
  v7 = (void *)sub_18BAC02C8();

  return v7;
}

- (id)searchTabsInteraction
{
  uint64_t v3;
  uint64_t v4;
  id v5;
  SFSiriLinkCoordinator *v6;
  void *v7;

  v3 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v4 = swift_allocObject();
  *(_QWORD *)(v4 + 16) = &unk_1EDFE97E0;
  *(_QWORD *)(v4 + 24) = v3;
  v5 = objc_allocWithZone((Class)sub_18BAC02D4());
  sub_18B89C6E8();
  v6 = self;
  v7 = (void *)sub_18BAC02C8();

  return v7;
}

- (id)listenToPageSiriReaderInteraction
{
  uint64_t v3;
  uint64_t v4;
  id v5;
  SFSiriLinkCoordinator *v6;
  void *v7;

  v3 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v4 = swift_allocObject();
  *(_QWORD *)(v4 + 16) = &unk_1EDFE9940;
  *(_QWORD *)(v4 + 24) = v3;
  v5 = objc_allocWithZone((Class)sub_18BAC02D4());
  sub_18B8A05BC();
  v6 = self;
  v7 = (void *)sub_18BAC02C8();

  return v7;
}

- (id)openViewInteraction
{
  uint64_t v3;
  uint64_t v4;
  id v5;
  SFSiriLinkCoordinator *v6;
  void *v7;

  v3 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v4 = swift_allocObject();
  *(_QWORD *)(v4 + 16) = &unk_1EDFE9CA8;
  *(_QWORD *)(v4 + 24) = v3;
  v5 = objc_allocWithZone((Class)sub_18BAC02D4());
  sub_18B8A4EFC();
  v6 = self;
  v7 = (void *)sub_18BAC02C8();

  return v7;
}

- (id)closeViewInteraction
{
  uint64_t v3;
  uint64_t v4;
  id v5;
  SFSiriLinkCoordinator *v6;
  void *v7;

  v3 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v4 = swift_allocObject();
  *(_QWORD *)(v4 + 16) = &unk_1EDFE9C98;
  *(_QWORD *)(v4 + 24) = v3;
  v5 = objc_allocWithZone((Class)sub_18BAC02D4());
  sub_18B8A54F0();
  v6 = self;
  v7 = (void *)sub_18BAC02C8();

  return v7;
}

- (id)searchWebAssistantIntentInteraction
{
  uint64_t v3;
  uint64_t v4;
  id v5;
  SFSiriLinkCoordinator *v6;
  void *v7;

  v3 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v4 = swift_allocObject();
  *(_QWORD *)(v4 + 16) = &unk_1EDFEB110;
  *(_QWORD *)(v4 + 24) = v3;
  v5 = objc_allocWithZone((Class)sub_18BAC02D4());
  sub_18B908AB4();
  v6 = self;
  v7 = (void *)sub_18BAC02C8();

  return v7;
}

- (id)openClearHistoryInteraction
{
  uint64_t v3;
  uint64_t v4;
  id v5;
  SFSiriLinkCoordinator *v6;
  void *v7;

  v3 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v4 = swift_allocObject();
  *(_QWORD *)(v4 + 16) = &unk_1EDFEDF88;
  *(_QWORD *)(v4 + 24) = v3;
  v5 = objc_allocWithZone((Class)sub_18BAC02D4());
  sub_18B9658EC();
  v6 = self;
  v7 = (void *)sub_18BAC02C8();

  return v7;
}

- (id)navigateContinuousReadingListInteraction
{
  uint64_t v3;
  uint64_t v4;
  id v5;
  SFSiriLinkCoordinator *v6;
  void *v7;

  v3 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v4 = swift_allocObject();
  *(_QWORD *)(v4 + 16) = &unk_1EDFF0418;
  *(_QWORD *)(v4 + 24) = v3;
  v5 = objc_allocWithZone((Class)sub_18BAC02D4());
  sub_18B9B0590();
  v6 = self;
  v7 = (void *)sub_18BAC02C8();

  return v7;
}

- (id)findOnPageInteraction
{
  uint64_t v3;
  uint64_t v4;
  id v5;
  SFSiriLinkCoordinator *v6;
  void *v7;

  v3 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v4 = swift_allocObject();
  *(_QWORD *)(v4 + 16) = &unk_1EDFF0E78;
  *(_QWORD *)(v4 + 24) = v3;
  v5 = objc_allocWithZone((Class)sub_18BAC02D4());
  sub_18B9C056C();
  v6 = self;
  v7 = (void *)sub_18BAC02C8();

  return v7;
}

- (id)createNewTabInteraction
{
  return sub_18B9C9604(self, (uint64_t)a2, (void (*)(void))sub_18B981034);
}

- (id)createNewTabInteractionForAssistantIntent
{
  return sub_18B9C9604(self, (uint64_t)a2, (void (*)(void))sub_18B967CA0);
}

- (id)openTabInteraction
{
  uint64_t v3;
  uint64_t v4;
  id v5;
  SFSiriLinkCoordinator *v6;
  void *v7;

  v3 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v4 = swift_allocObject();
  *(_QWORD *)(v4 + 16) = &unk_1EDFF13A0;
  *(_QWORD *)(v4 + 24) = v3;
  v5 = objc_allocWithZone((Class)sub_18BAC02D4());
  sub_18B9818AC();
  v6 = self;
  v7 = (void *)sub_18BAC02C8();

  return v7;
}

- (id)closeTabInteraction
{
  uint64_t v3;
  uint64_t v4;
  id v5;
  SFSiriLinkCoordinator *v6;
  void *v7;

  v3 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v4 = swift_allocObject();
  *(_QWORD *)(v4 + 16) = &unk_1EDFF1390;
  *(_QWORD *)(v4 + 24) = v3;
  v5 = objc_allocWithZone((Class)sub_18BAC02D4());
  sub_18B982060();
  v6 = self;
  v7 = (void *)sub_18BAC02C8();

  return v7;
}

- (id)loadURLInTabInteraction
{
  return sub_18B9C9604(self, (uint64_t)a2, (void (*)(void))sub_18B982ED0);
}

- (id)createNewTabGroupInteraction
{
  id v3;
  SFSiriLinkCoordinator *v4;
  void *v5;

  swift_allocObject();
  swift_unknownObjectWeakInit();
  v3 = objc_allocWithZone((Class)sub_18BAC02D4());
  sub_18B9413D0();
  v4 = self;
  v5 = (void *)sub_18BAC02C8();

  return v5;
}

- (id)openTabGroupInteraction
{
  uint64_t v3;
  uint64_t v4;
  id v5;
  SFSiriLinkCoordinator *v6;
  void *v7;

  v3 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v4 = swift_allocObject();
  *(_QWORD *)(v4 + 16) = &unk_1EDFF1770;
  *(_QWORD *)(v4 + 24) = v3;
  v5 = objc_allocWithZone((Class)sub_18BAC02D4());
  sub_18B941414();
  v6 = self;
  v7 = (void *)sub_18BAC02C8();

  return v7;
}

- (id)createNewBookmarkInteraction
{
  uint64_t v3;
  uint64_t v4;
  id v5;
  SFSiriLinkCoordinator *v6;
  void *v7;

  v3 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v4 = swift_allocObject();
  *(_QWORD *)(v4 + 16) = &unk_1EDFF1A20;
  *(_QWORD *)(v4 + 24) = v3;
  v5 = objc_allocWithZone((Class)sub_18BAC02D4());
  sub_18B9F9FFC();
  v6 = self;
  v7 = (void *)sub_18BAC02C8();

  return v7;
}

- (id)openBookmarkInteraction
{
  uint64_t v3;
  uint64_t v4;
  id v5;
  SFSiriLinkCoordinator *v6;
  void *v7;

  v3 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v4 = swift_allocObject();
  *(_QWORD *)(v4 + 16) = &unk_1EDFF1A10;
  *(_QWORD *)(v4 + 24) = v3;
  v5 = objc_allocWithZone((Class)sub_18BAC02D4());
  sub_18B9FA524();
  v6 = self;
  v7 = (void *)sub_18BAC02C8();

  return v7;
}

- (id)openBookmarkInTabInteraction
{
  uint64_t v3;
  uint64_t v4;
  id v5;
  SFSiriLinkCoordinator *v6;
  void *v7;

  v3 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v4 = swift_allocObject();
  *(_QWORD *)(v4 + 16) = &unk_1EDFF1A00;
  *(_QWORD *)(v4 + 24) = v3;
  v5 = objc_allocWithZone((Class)sub_18BAC02D4());
  sub_18B966F28();
  v6 = self;
  v7 = (void *)sub_18BAC02C8();

  return v7;
}

- (id)createNewPrivateTabInteraction
{
  uint64_t v3;
  uint64_t v4;
  id v5;
  SFSiriLinkCoordinator *v6;
  void *v7;

  v3 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v4 = swift_allocObject();
  *(_QWORD *)(v4 + 16) = &unk_1EDFF23B8;
  *(_QWORD *)(v4 + 24) = v3;
  v5 = objc_allocWithZone((Class)sub_18BAC02D4());
  sub_18BA27C34();
  v6 = self;
  v7 = (void *)sub_18BAC02C8();

  return v7;
}

+ (void)setApplicationProxy:(id)a3
{
  swift_unknownObjectRetain();
  _sSo21SFSiriLinkCoordinatorC12MobileSafariE19setApplicationProxyyySo09SFBrowsergH0_pFZ_0();
  swift_unknownObjectRelease();
}

- (SFSiriLinkActionPerformer)actionPerformer
{
  char *v2;

  v2 = (char *)self + OBJC_IVAR___SFSiriLinkCoordinator_actionPerformer;
  swift_beginAccess();
  return (SFSiriLinkActionPerformer *)(id)MEMORY[0x18D77FD08](v2);
}

- (void)setActionPerformer:(id)a3
{
  swift_beginAccess();
  swift_unknownObjectWeakAssign();
}

- (SFSiriLinkCoordinator)init
{
  objc_super v4;

  swift_unknownObjectWeakInit();
  v4.receiver = self;
  v4.super_class = (Class)SFSiriLinkCoordinator;
  return -[SFSiriLinkCoordinator init](&v4, sel_init);
}

- (void).cxx_destruct
{
  sub_18B913BBC((uint64_t)self + OBJC_IVAR___SFSiriLinkCoordinator_actionPerformer);
}

- (id)createReadingListItemInteraction
{
  uint64_t v3;
  uint64_t v4;
  id v5;
  SFSiriLinkCoordinator *v6;
  void *v7;

  v3 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v4 = swift_allocObject();
  *(_QWORD *)(v4 + 16) = &unk_1EDFF3068;
  *(_QWORD *)(v4 + 24) = v3;
  v5 = objc_allocWithZone((Class)sub_18BAC02D4());
  sub_18B94138C();
  v6 = self;
  v7 = (void *)sub_18BAC02C8();

  return v7;
}

- (id)openReadingListItemInteraction
{
  uint64_t v3;
  uint64_t v4;
  id v5;
  SFSiriLinkCoordinator *v6;
  void *v7;

  v3 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v4 = swift_allocObject();
  *(_QWORD *)(v4 + 16) = &unk_1EDFF3058;
  *(_QWORD *)(v4 + 24) = v3;
  v5 = objc_allocWithZone((Class)sub_18BAC02D4());
  sub_18BA5F648();
  v6 = self;
  v7 = (void *)sub_18BAC02C8();

  return v7;
}

- (id)webSearchInteraction
{
  uint64_t v3;
  uint64_t v4;
  id v5;
  SFSiriLinkCoordinator *v6;
  void *v7;

  v3 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v4 = swift_allocObject();
  *(_QWORD *)(v4 + 16) = &unk_1EDFF3C28;
  *(_QWORD *)(v4 + 24) = v3;
  v5 = objc_allocWithZone((Class)sub_18BAC02D4());
  sub_18BA78C74();
  v6 = self;
  v7 = (void *)sub_18BAC02C8();

  return v7;
}

@end
