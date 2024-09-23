@implementation BrowsingAssistant

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (void)viewDidLoad
{
  _TtC12MobileSafari17BrowsingAssistant *v2;

  v2 = self;
  sub_18B90CE8C();

}

- (void)viewWillLayoutSubviews
{
  _TtC12MobileSafari17BrowsingAssistant *v2;

  v2 = self;
  sub_18B90D408();

}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  _TtC12MobileSafari17BrowsingAssistant *v6;

  v6 = self;
  sub_18B90D548(a3, a4);

}

- (_TtC12MobileSafari17BrowsingAssistant)initWithNibName:(id)a3 bundle:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  if (a3)
  {
    v5 = sub_18BAC0DFC();
    v7 = v6;
  }
  else
  {
    v5 = 0;
    v7 = 0;
  }
  v8 = a4;
  return (_TtC12MobileSafari17BrowsingAssistant *)sub_18B90FD70(v5, v7, a4);
}

- (_TtC12MobileSafari17BrowsingAssistant)initWithCoder:(id)a3
{
  return (_TtC12MobileSafari17BrowsingAssistant *)sub_18B91015C(a3);
}

- (void).cxx_destruct
{
  sub_18B913BBC((uint64_t)self + OBJC_IVAR____TtC12MobileSafari17BrowsingAssistant_dataSource);
  sub_18B913BBC((uint64_t)self + OBJC_IVAR____TtC12MobileSafari17BrowsingAssistant_delegate);
  sub_18B894A1C((uint64_t)self + OBJC_IVAR____TtC12MobileSafari17BrowsingAssistant____lazy_storage___listCellRegistration, &qword_1EDFEB580);
  sub_18B894A1C((uint64_t)self + OBJC_IVAR____TtC12MobileSafari17BrowsingAssistant____lazy_storage___popUpCellRegistration, &qword_1EDFEB578);
  sub_18B894A1C((uint64_t)self + OBJC_IVAR____TtC12MobileSafari17BrowsingAssistant____lazy_storage___switchCellRegistration, (uint64_t *)&unk_1EDFEB568);
  sub_18B894A1C((uint64_t)self + OBJC_IVAR____TtC12MobileSafari17BrowsingAssistant____lazy_storage___consentCardCellRegistration, &qword_1EDFEB560);
  sub_18B894A1C((uint64_t)self + OBJC_IVAR____TtC12MobileSafari17BrowsingAssistant____lazy_storage___entityCardCellRegistration, &qword_1EDFEB558);
  sub_18B894A1C((uint64_t)self + OBJC_IVAR____TtC12MobileSafari17BrowsingAssistant____lazy_storage___listenToPageCardCellRegistration, &qword_1EDFEB550);
  sub_18B894A1C((uint64_t)self + OBJC_IVAR____TtC12MobileSafari17BrowsingAssistant____lazy_storage___readerCardCellRegistration, &qword_1EDFEB548);
  sub_18B894A1C((uint64_t)self+ OBJC_IVAR____TtC12MobileSafari17BrowsingAssistant____lazy_storage___readerOptionsCardCellRegistration, &qword_1EDFEB540);
  sub_18B894A1C((uint64_t)self + OBJC_IVAR____TtC12MobileSafari17BrowsingAssistant____lazy_storage___sectionHeaderRegistration, &qword_1EDFEB530);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12MobileSafari17BrowsingAssistant_globalHeaderFooter));
  sub_18B894A1C((uint64_t)self + OBJC_IVAR____TtC12MobileSafari17BrowsingAssistant____lazy_storage___globalHeaderFooterRegistration, &qword_1EDFEB528);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12MobileSafari17BrowsingAssistant____lazy_storage___collectionDataSource));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12MobileSafari17BrowsingAssistant_collectionView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12MobileSafari17BrowsingAssistant____lazy_storage___sizingListCell));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12MobileSafari17BrowsingAssistant____lazy_storage___sizingPopUpCell));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12MobileSafari17BrowsingAssistant____lazy_storage___sizingSwitchCell));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12MobileSafari17BrowsingAssistant____lazy_storage___sizingConsentCardCell));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12MobileSafari17BrowsingAssistant____lazy_storage___sizingListenToPageCardCell));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12MobileSafari17BrowsingAssistant____lazy_storage___sizingReaderCardCell));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12MobileSafari17BrowsingAssistant____lazy_storage___sizingReaderOptionsCardCell));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12MobileSafari17BrowsingAssistant____lazy_storage___sizingHeader));
}

- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  _TtC12MobileSafari17BrowsingAssistant *v11;
  void *v12;
  unsigned __int8 v13;
  uint64_t v15;

  v6 = sub_18BAC019C();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_18BAC016C();
  v10 = a3;
  v11 = self;
  v12 = (void *)sub_18BAC0154();
  v13 = -[BrowsingAssistant collectionView:canPerformPrimaryActionForItemAtIndexPath:](v11, sel_collectionView_canPerformPrimaryActionForItemAtIndexPath_, v10, v12);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return v13;
}

- (BOOL)collectionView:(id)a3 canPerformPrimaryActionForItemAtIndexPath:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  _TtC12MobileSafari17BrowsingAssistant *v11;
  uint64_t v13;

  v6 = sub_18BAC019C();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_18BAC016C();
  v10 = a3;
  v11 = self;
  LOBYTE(self) = sub_18B910A70(v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return self & 1;
}

- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v9;

  v4 = sub_18BAC019C();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_18BAC016C();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return 0;
}

- (void)collectionView:(id)a3 performPrimaryActionForItemAtIndexPath:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  _TtC12MobileSafari17BrowsingAssistant *v11;
  uint64_t v12;

  v6 = sub_18BAC019C();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_18BAC016C();
  v10 = a3;
  v11 = self;
  sub_18B910CA0(v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (id)collectionView:(id)a3 targetIndexPathForMoveOfItemFromOriginalIndexPath:(id)a4 atCurrentIndexPath:(id)a5 toProposedIndexPath:(id)a6
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  id v20;
  _TtC12MobileSafari17BrowsingAssistant *v21;
  void (*v22)(char *, uint64_t);
  void *v23;
  uint64_t v25;
  _TtC12MobileSafari17BrowsingAssistant *v26;

  v26 = self;
  v7 = sub_18BAC019C();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x1E0C80A78](v7);
  v10 = (char *)&v25 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v11);
  v13 = (char *)&v25 - v12;
  MEMORY[0x1E0C80A78](v14);
  v16 = (char *)&v25 - v15;
  MEMORY[0x1E0C80A78](v17);
  v19 = (char *)&v25 - v18;
  sub_18BAC016C();
  sub_18BAC016C();
  sub_18BAC016C();
  v20 = a3;
  v21 = v26;
  sub_18B910F98((uint64_t)v16, (uint64_t)v10, (uint64_t)v19);

  v22 = *(void (**)(char *, uint64_t))(v8 + 8);
  v22(v10, v7);
  v22(v13, v7);
  v22(v16, v7);
  v23 = (void *)sub_18BAC0154();
  v22(v19, v7);
  return v23;
}

- (void)collectionView:(id)a3 willDisplaySupplementaryView:(id)a4 forElementKind:(id)a5 atIndexPath:(id)a6
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  id v17;
  _TtC12MobileSafari17BrowsingAssistant *v18;
  uint64_t v19;

  v9 = sub_18BAC019C();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x1E0C80A78](v9);
  v12 = (char *)&v19 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = sub_18BAC0DFC();
  v15 = v14;
  sub_18BAC016C();
  v16 = a3;
  v17 = a4;
  v18 = self;
  sub_18B913A08(v13, v15);

  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
}

- (void)menuItemDidUpdate:(id)a3
{
  _TtC12MobileSafari17BrowsingAssistant *v5;

  swift_unknownObjectRetain();
  v5 = self;
  sub_18B90EC58(a3, 1, (uint64_t)CGRectMake, 0);
  swift_unknownObjectRelease();

}

- (void)cardItemDidUpdate:(id)a3
{
  id v4;
  _TtC12MobileSafari17BrowsingAssistant *v5;

  v4 = a3;
  v5 = self;
  sub_18B911370(v4);

}

- (void)perSiteSettingDidUpdate:(id)a3
{
  _TtC12MobileSafari17BrowsingAssistant *v5;

  swift_unknownObjectRetain();
  v5 = self;
  sub_18B911590(a3);
  swift_unknownObjectRelease();

}

- (void)listCellDidDeleteCell:(id)a3
{
  id v4;
  _TtC12MobileSafari17BrowsingAssistant *v5;

  v4 = a3;
  v5 = self;
  sub_18B9118CC((uint64_t)v4);

}

- (void)listCellDidInsertCell:(id)a3
{
  id v4;
  _TtC12MobileSafari17BrowsingAssistant *v5;

  v4 = a3;
  v5 = self;
  sub_18B911C94((uint64_t)v4);

}

@end
