@implementation _PlaceableAsJUPlaceable

- (JUMeasurements)measureToFit:(CGSize)a3 withTraitCollection:(id)a4
{
  double height;
  double width;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  double (*v11)(id, uint64_t, uint64_t, double, double);
  id v12;
  _TtC5JetUI23_PlaceableAsJUPlaceable *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  JUMeasurements result;

  height = a3.height;
  width = a3.width;
  v8 = (Class *)((char *)&self->super.isa + OBJC_IVAR____TtC5JetUI23_PlaceableAsJUPlaceable_base);
  v9 = v8[3];
  v10 = v8[4];
  __swift_project_boxed_opaque_existential_1(v8, v9);
  v11 = *(double (**)(id, uint64_t, uint64_t, double, double))(v10 + 8);
  v12 = a4;
  v13 = self;
  v14 = v11(v12, v9, v10, width, height);
  v16 = v15;
  v18 = v17;
  v20 = v19;

  v21 = v14;
  v22 = v16;
  v23 = v18;
  v24 = v20;
  result.var3 = v24;
  result.var2 = v23;
  result.var1 = v22;
  result.var0 = v21;
  return result;
}

- (void)placeAtRect:(CGRect)a3 withTraitCollection:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(id, uint64_t, uint64_t, double, double, double, double);
  id v14;
  _TtC5JetUI23_PlaceableAsJUPlaceable *v15;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v10 = (Class *)((char *)&self->super.isa + OBJC_IVAR____TtC5JetUI23_PlaceableAsJUPlaceable_base);
  v11 = v10[3];
  v12 = v10[4];
  __swift_project_boxed_opaque_existential_1(v10, v11);
  v13 = *(void (**)(id, uint64_t, uint64_t, double, double, double, double))(v12 + 16);
  v14 = a4;
  v15 = self;
  v13(v14, v11, v12, x, y, width, height);

}

- (NSString)description
{
  void *v2;
  _BYTE v4[40];

  sub_1AC68E218((uint64_t)self + OBJC_IVAR____TtC5JetUI23_PlaceableAsJUPlaceable_base, (uint64_t)v4);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED0BD560);
  sub_1AC726268();
  v2 = (void *)sub_1AC726208();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (_TtC5JetUI23_PlaceableAsJUPlaceable)init
{
  _TtC5JetUI23_PlaceableAsJUPlaceable *result;

  result = (_TtC5JetUI23_PlaceableAsJUPlaceable *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC5JetUI23_PlaceableAsJUPlaceable_base);
}

@end
