@implementation ActivityListItemHostViewController

- (_TtC18ActivityUIServices34ActivityListItemHostViewController)initWithActivityDescriptor:(id)a3 systemMetricsRequest:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  char *v11;
  id v12;
  id v13;
  id v14;
  _TtC18ActivityUIServices34ActivityListItemHostViewController *v15;
  uint64_t v17;

  v5 = sub_22D84B340();
  v6 = *(_QWORD *)(v5 - 8);
  v7 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v7);
  v11 = (char *)&v17 - v10;
  sub_22D816680();
  sub_22D84B448();
  (*(void (**)(char *, char *, uint64_t))(v6 + 16))(v9, v11, v5);
  v12 = objc_allocWithZone((Class)type metadata accessor for ActivitySceneDescriptor());
  v13 = a4;
  v14 = sub_22D83F648(0, (uint64_t)v9, v13, 0, 0);
  v15 = (_TtC18ActivityUIServices34ActivityListItemHostViewController *)ActivityHostViewController.init(activitySceneDescriptor:)(v14);

  (*(void (**)(char *, uint64_t))(v6 + 8))(v11, v5);
  return v15;
}

- (_TtC18ActivityUIServices34ActivityListItemHostViewController)initWithCoder:(id)a3
{
  _TtC18ActivityUIServices34ActivityListItemHostViewController *result;

  result = (_TtC18ActivityUIServices34ActivityListItemHostViewController *)sub_22D84B8C8();
  __break(1u);
  return result;
}

- (_TtC18ActivityUIServices34ActivityListItemHostViewController)initWithActivitySceneDescriptor:(id)a3
{
  id v3;
  _TtC18ActivityUIServices34ActivityListItemHostViewController *result;

  v3 = a3;
  result = (_TtC18ActivityUIServices34ActivityListItemHostViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
