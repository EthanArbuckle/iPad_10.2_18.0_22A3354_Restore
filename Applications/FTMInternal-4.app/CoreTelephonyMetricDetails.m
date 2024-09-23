@implementation CoreTelephonyMetricDetails

- (void)viewDidLoad
{
  _TtC13FTMInternal_426CoreTelephonyMetricDetails *v2;

  v2 = self;
  sub_1001A1F0C();

}

- (void)update
{
  objc_msgSend(*(id *)((char *)&self->super.super.super.super.isa+ OBJC_IVAR____TtC13FTMInternal_426CoreTelephonyMetricDetails_collectionView), "reloadData");
}

- (_TtC13FTMInternal_426CoreTelephonyMetricDetails)initWithNibName:(id)a3 bundle:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  if (a3)
  {
    v5 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
    v7 = v6;
  }
  else
  {
    v5 = 0;
    v7 = 0;
  }
  v8 = a4;
  return (_TtC13FTMInternal_426CoreTelephonyMetricDetails *)sub_1001A2330(v5, v7, a4);
}

- (_TtC13FTMInternal_426CoreTelephonyMetricDetails)initWithCoder:(id)a3
{
  return (_TtC13FTMInternal_426CoreTelephonyMetricDetails *)sub_1001A2460(a3);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.isa
                                     + OBJC_IVAR____TtC13FTMInternal_426CoreTelephonyMetricDetails_bandItems));
  swift_bridgeObjectRelease(*(_QWORD *)&self->bandItems[OBJC_IVAR____TtC13FTMInternal_426CoreTelephonyMetricDetails_sectionTitle]);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC13FTMInternal_426CoreTelephonyMetricDetails_collectionView));
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  return (*(_QWORD **)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC13FTMInternal_426CoreTelephonyMetricDetails_bandItems))[2];
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  return 1;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  _TtC13FTMInternal_426CoreTelephonyMetricDetails *v12;
  void *v13;
  uint64_t v15;

  v7 = type metadata accessor for IndexPath(0, a2, a3);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = self;
  v13 = (void *)sub_1001A2614(v11);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return v13;
}

- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  _TtC13FTMInternal_426CoreTelephonyMetricDetails *v17;
  id v18;
  uint64_t v20;

  v9 = type metadata accessor for IndexPath(0, a2, a3);
  v10 = *(_QWORD *)(v9 - 8);
  __chkstk_darwin(v9);
  v12 = (char *)&v20 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v15 = v14;
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a5);
  v16 = a3;
  v17 = self;
  v18 = sub_1001A2994(v16, v13, v15);

  swift_bridgeObjectRelease(v15);
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  return v18;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  id v13;
  id v14;
  _TtC13FTMInternal_426CoreTelephonyMetricDetails *v15;
  CGFloat Width;
  double v17;
  double v18;
  uint64_t v19;
  CGSize result;
  CGRect v21;

  v9 = type metadata accessor for IndexPath(0, a2, a3);
  v10 = *(_QWORD *)(v9 - 8);
  __chkstk_darwin(v9);
  v12 = (char *)&v19 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a5);
  v13 = a3;
  v14 = a4;
  v15 = self;
  objc_msgSend(v13, "bounds");
  Width = CGRectGetWidth(v21);

  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  v17 = 60.0;
  v18 = Width;
  result.height = v17;
  result.width = v18;
  return result;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 referenceSizeForHeaderInSection:(int64_t)a5
{
  double v5;
  double v6;
  double v7;
  CGSize result;

  objc_msgSend(a3, "frame");
  v6 = v5;
  v7 = 20.0;
  result.height = v7;
  result.width = v6;
  return result;
}

@end
