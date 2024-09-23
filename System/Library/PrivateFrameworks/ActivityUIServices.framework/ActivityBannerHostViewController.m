@implementation ActivityBannerHostViewController

- (_TtC18ActivityUIServices32ActivityBannerHostViewController)initWithActivityDescriptor:(id)a3 systemMetricsRequest:(id)a4 payloadID:(id)a5
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  void *v15;
  id v16;
  id v17;
  _TtC18ActivityUIServices32ActivityBannerHostViewController *v18;
  uint64_t v20;

  v7 = sub_22D84B340();
  v8 = *(_QWORD *)(v7 - 8);
  v9 = MEMORY[0x24BDAC7A8](v7);
  v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v9);
  v13 = (char *)&v20 - v12;
  sub_22D816680();
  sub_22D84B448();
  if (a5)
  {
    v14 = sub_22D84B5C8();
    a5 = v15;
  }
  else
  {
    v14 = 0;
  }
  (*(void (**)(char *, char *, uint64_t))(v8 + 16))(v11, v13, v7);
  objc_allocWithZone((Class)type metadata accessor for ActivitySceneDescriptor());
  v16 = a4;
  v17 = sub_22D83F648(1, (uint64_t)v11, v16, v14, (uint64_t)a5);
  v18 = (_TtC18ActivityUIServices32ActivityBannerHostViewController *)ActivityHostViewController.init(activitySceneDescriptor:)(v17);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v13, v7);
  return v18;
}

- (_TtC18ActivityUIServices32ActivityBannerHostViewController)initWithCoder:(id)a3
{
  _TtC18ActivityUIServices32ActivityBannerHostViewController *result;

  result = (_TtC18ActivityUIServices32ActivityBannerHostViewController *)sub_22D84B8C8();
  __break(1u);
  return result;
}

- (_TtC18ActivityUIServices32ActivityBannerHostViewController)initWithActivitySceneDescriptor:(id)a3
{
  id v3;
  _TtC18ActivityUIServices32ActivityBannerHostViewController *result;

  v3 = a3;
  result = (_TtC18ActivityUIServices32ActivityBannerHostViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
