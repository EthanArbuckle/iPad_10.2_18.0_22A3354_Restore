@implementation AtrialFibrillationDataTypeDetailViewController

- (_TtC5Heart46AtrialFibrillationDataTypeDetailViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_231347CB0();
}

- (void)viewDidLoad
{
  _TtC5Heart46AtrialFibrillationDataTypeDetailViewController *v2;

  v2 = self;
  sub_2313449C8();

}

- (BOOL)isPinned
{
  _TtC5Heart46AtrialFibrillationDataTypeDetailViewController *v2;
  char v3;

  v2 = self;
  v3 = sub_231344DAC();

  return v3 & 1;
}

- (void)setPinned:(BOOL)a3
{
  _TtC5Heart46AtrialFibrillationDataTypeDetailViewController *v4;

  v4 = self;
  sub_231344FF4(a3);

}

- (void)recomputeTotalSampleCount
{
  _TtC5Heart46AtrialFibrillationDataTypeDetailViewController *v2;

  v2 = self;
  sub_2313451E0();

}

- (void)showAddDataVC
{
  _TtC5Heart46AtrialFibrillationDataTypeDetailViewController *v2;

  v2 = self;
  sub_2313453C4();

}

- (void)didSelectRegulatoryRow
{
  _TtC5Heart46AtrialFibrillationDataTypeDetailViewController *v2;

  v2 = self;
  sub_2313457BC();

}

- (id)featureStatusCells
{
  unint64_t v3;
  uint64_t v4;
  _TtC5Heart46AtrialFibrillationDataTypeDetailViewController *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  void *v13;
  _TtC5Heart46AtrialFibrillationDataTypeDetailViewController *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  v3 = *(unint64_t *)((char *)&self->super.super.super.super.super.super.isa
                           + OBJC_IVAR____TtC5Heart46AtrialFibrillationDataTypeDetailViewController_allFeatureStatusCellsFromFeedItems);
  if (v3 >> 62)
  {
    swift_bridgeObjectRetain_n();
    v15 = self;
    v16 = sub_231414F08();
    swift_bridgeObjectRelease();
    sub_231412A90();
    v17 = sub_231414F08();
    swift_bridgeObjectRelease();
    if (v17 < 0)
      __break(1u);
    if (v16 >= 1)
      v18 = 1;
    else
      v18 = v16;
    if (v16 < 0)
      v19 = 1;
    else
      v19 = v18;
    sub_231412A90();
    v20 = sub_231414F08();
    swift_bridgeObjectRelease();
    if (v20 < v19)
      __break(1u);
    v4 = v19;
  }
  else
  {
    if (*(uint64_t *)((v3 & 0xFFFFFFFFFFFFF8) + 0x10) >= 1)
      v4 = 1;
    else
      v4 = *(_QWORD *)((v3 & 0xFFFFFFFFFFFFF8) + 0x10);
    sub_231412A90();
    v5 = self;
  }
  v6 = sub_2313471B0(0, v4, v3);
  v8 = v7;
  v10 = v9;
  v12 = v11;
  swift_bridgeObjectRelease();
  sub_231347DAC(v6, v8, v10, v12);

  sub_2314130CC();
  sub_2312D3C68(0, &qword_255ECDD10);
  v13 = (void *)sub_231414788();
  swift_bridgeObjectRelease();
  return v13;
}

- (id)featureStatusFooterView
{
  _TtC5Heart46AtrialFibrillationDataTypeDetailViewController *v2;
  void *v3;

  v2 = self;
  v3 = (void *)sub_231346444();

  return v3;
}

- (void)featureStatusCellTappedAtIndexPath:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  _TtC5Heart46AtrialFibrillationDataTypeDetailViewController *v8;
  uint64_t v9;

  v4 = sub_2314117F4();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2314117B8();
  v8 = self;
  sub_231346920();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (id)makeInternalSettingsControllerWithHealthStore:(id)a3
{
  return objc_msgSend(objc_allocWithZone((Class)type metadata accessor for IRNInternalSettingsViewController()), sel_initWithHealthStore_, a3);
}

- (void)snapshotDidChangeWithDataSourceID:(id)a3 snapshot:(id)a4 animated:(BOOL)a5
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  _TtC5Heart46AtrialFibrillationDataTypeDetailViewController *v14;
  uint64_t v15;

  sub_2313479C0();
  v7 = v6;
  v8 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_2314146BC();
  v13 = v12;
  sub_231413948();
  v14 = self;
  sub_231347E88(v11, v13);

  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

- (_TtC5Heart46AtrialFibrillationDataTypeDetailViewController)initWithDisplayType:(id)a3 profile:(id)a4 mode:(int64_t)a5
{
  id v6;
  id v7;
  _TtC5Heart46AtrialFibrillationDataTypeDetailViewController *result;

  v6 = a3;
  v7 = a4;
  result = (_TtC5Heart46AtrialFibrillationDataTypeDetailViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC5Heart46AtrialFibrillationDataTypeDetailViewController)initWithUsingInsetStyling:(BOOL)a3
{
  _TtC5Heart46AtrialFibrillationDataTypeDetailViewController *result;

  result = (_TtC5Heart46AtrialFibrillationDataTypeDetailViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC5Heart46AtrialFibrillationDataTypeDetailViewController)initWithStyle:(int64_t)a3
{
  _TtC5Heart46AtrialFibrillationDataTypeDetailViewController *result;

  result = (_TtC5Heart46AtrialFibrillationDataTypeDetailViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC5Heart46AtrialFibrillationDataTypeDetailViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC5Heart46AtrialFibrillationDataTypeDetailViewController *result;

  v4 = a4;
  result = (_TtC5Heart46AtrialFibrillationDataTypeDetailViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_231347BDC((uint64_t)self + OBJC_IVAR____TtC5Heart46AtrialFibrillationDataTypeDetailViewController_consumedHealthExperienceStore, &qword_255ECC210, (unint64_t *)&qword_255ECE930);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5Heart46AtrialFibrillationDataTypeDetailViewController_providedHealthStore));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5Heart46AtrialFibrillationDataTypeDetailViewController_objectType));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5Heart46AtrialFibrillationDataTypeDetailViewController_displayType));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5Heart46AtrialFibrillationDataTypeDetailViewController_viewControllerFactory));
  _s5Heart41FeedItemContextPreviousFeedItemFetcherBoxVwxx_0((uint64_t)self + OBJC_IVAR____TtC5Heart46AtrialFibrillationDataTypeDetailViewController_pinnedContentManager);
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
