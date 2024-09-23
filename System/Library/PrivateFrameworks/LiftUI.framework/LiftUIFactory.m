@implementation LiftUIFactory

+ (id)viewControllerWithJson:(id)a3 delegate:(id)a4 dataSource:(id)a5
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  v7 = sub_1B1035B94();
  v9 = v8;
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  v10 = (void *)_s6LiftUI0A9UIFactoryC14viewController4json8delegate10dataSourceSo06UIViewE0CSS_So0A10UIDelegate_pSgSo0a6UIDataI0_pSgtFZ_0(v7, v9, (uint64_t)a4, (uint64_t)a5);
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  return v10;
}

+ (id)viewControllerWithData:(id)a3 delegate:(id)a4 dataSource:(id)a5
{
  id v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  void *v11;

  v7 = a3;
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  v8 = sub_1B10345F8();
  v10 = v9;

  v11 = (void *)_s6LiftUI0A9UIFactoryC14viewController4data8delegate0F6SourceSo06UIViewE0C10Foundation4DataV_So0A10UIDelegate_pSgSo0a6UIDataH0_pSgtFZ_0(v8, v10, (uint64_t)a4, (uint64_t)a5);
  sub_1B0F576D8(v8, v10);
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  return v11;
}

+ (id)viewControllerWithUrl:(id)a3 delegate:(id)a4 dataSource:(id)a5
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  void *v11;
  uint64_t v13;

  v7 = sub_1B10345E0();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x1E0C80A78](v7);
  v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B10345C8();
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  v11 = (void *)_s6LiftUI0A9UIFactoryC14viewController3url8delegate10dataSourceSo06UIViewE0C10Foundation3URLV_So0A10UIDelegate_pSgSo0a6UIDataI0_pSgtFZ_0((uint64_t)v10, (uint64_t)a4, (uint64_t)a5);
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return v11;
}

- (_TtC6LiftUI13LiftUIFactory)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for LiftUIFactory();
  return -[LiftUIFactory init](&v3, sel_init);
}

@end
