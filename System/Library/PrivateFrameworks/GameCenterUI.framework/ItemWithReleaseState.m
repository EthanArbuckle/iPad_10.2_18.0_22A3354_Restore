@implementation ItemWithReleaseState

+ (id)titleTextWithTitle:(id)a3 accessibilityDescription:(id)a4 systemSymbolName:(id)a5 tooltipText:(id)a6 paragraphStyle:(id)a7
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  id v20;
  id v21;

  v9 = sub_1AB7DAF90();
  v11 = v10;
  v12 = sub_1AB7DAF90();
  v14 = v13;
  v15 = sub_1AB7DAF90();
  v17 = v16;
  if (a6)
  {
    v18 = sub_1AB7DAF90();
    a6 = v19;
  }
  else
  {
    v18 = 0;
  }
  v20 = a7;
  v21 = static ItemWithReleaseState.titleText(title:accessibilityDescription:systemSymbolName:tooltipText:paragraphStyle:)(v9, v11, v12, v14, v15, v17, v18, (uint64_t)a6, a7);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v21;
}

- (_TtC12GameCenterUI20ItemWithReleaseState)init
{
  return (_TtC12GameCenterUI20ItemWithReleaseState *)ItemWithReleaseState.init()();
}

@end
