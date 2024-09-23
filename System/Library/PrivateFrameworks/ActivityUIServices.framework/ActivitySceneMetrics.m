@implementation ActivitySceneMetrics

- (CGSize)size
{
  double *v2;
  double v3;
  double v4;
  CGSize result;

  v2 = (double *)((char *)self + OBJC_IVAR____TtC18ActivityUIServices20ActivitySceneMetrics_size);
  swift_beginAccess();
  v3 = *v2;
  v4 = v2[1];
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)setSize:(CGSize)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat *v5;

  height = a3.height;
  width = a3.width;
  v5 = (CGFloat *)((char *)self + OBJC_IVAR____TtC18ActivityUIServices20ActivitySceneMetrics_size);
  swift_beginAccess();
  *v5 = width;
  v5[1] = height;
}

- (double)cornerRadius
{
  double *v2;

  v2 = (double *)((char *)self + OBJC_IVAR____TtC18ActivityUIServices20ActivitySceneMetrics_cornerRadius);
  swift_beginAccess();
  return *v2;
}

- (void)setCornerRadius:(double)a3
{
  double *v4;

  v4 = (double *)((char *)self + OBJC_IVAR____TtC18ActivityUIServices20ActivitySceneMetrics_cornerRadius);
  swift_beginAccess();
  *v4 = a3;
}

- (_TtC18ActivityUIServices18ActivityEdgeInsets)edgeInsets
{
  id *v2;

  v2 = (id *)((char *)&self->super.isa + OBJC_IVAR____TtC18ActivityUIServices20ActivitySceneMetrics_edgeInsets);
  swift_beginAccess();
  return (_TtC18ActivityUIServices18ActivityEdgeInsets *)*v2;
}

- (void)setEdgeInsets:(id)a3
{
  void **v4;
  void *v5;
  id v6;

  v4 = (void **)((char *)&self->super.isa + OBJC_IVAR____TtC18ActivityUIServices20ActivitySceneMetrics_edgeInsets);
  swift_beginAccess();
  v5 = *v4;
  *v4 = a3;
  v6 = a3;

}

- (_TtC18ActivityUIServices20ActivitySceneMetrics)initWithXPCDictionary:(id)a3
{
  _TtC18ActivityUIServices20ActivitySceneMetrics *v3;

  swift_unknownObjectRetain();
  v3 = (_TtC18ActivityUIServices20ActivitySceneMetrics *)sub_22D83D6AC();
  swift_unknownObjectRelease();
  return v3;
}

- (void)encodeWithXPCDictionary:(id)a3
{
  _TtC18ActivityUIServices20ActivitySceneMetrics *v5;

  swift_unknownObjectRetain();
  v5 = self;
  sub_22D83CAC8((uint64_t)a3);
  swift_unknownObjectRelease();

}

- (_TtC18ActivityUIServices20ActivitySceneMetrics)initWithSize:(CGSize)a3 cornerRadius:(double)a4 edgeInsets:(id)a5
{
  void **v7;
  void *v8;
  id v9;
  _TtC18ActivityUIServices20ActivitySceneMetrics *v10;
  objc_super v12;

  v7 = (void **)((char *)&self->super.isa + OBJC_IVAR____TtC18ActivityUIServices20ActivitySceneMetrics_edgeInsets);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC18ActivityUIServices20ActivitySceneMetrics_edgeInsets) = 0;
  *(CGSize *)((char *)&self->super.isa + OBJC_IVAR____TtC18ActivityUIServices20ActivitySceneMetrics_size) = a3;
  *(double *)((char *)&self->super.isa + OBJC_IVAR____TtC18ActivityUIServices20ActivitySceneMetrics_cornerRadius) = a4;
  swift_beginAccess();
  v8 = *v7;
  *v7 = a5;
  v9 = a5;

  v12.receiver = self;
  v12.super_class = (Class)type metadata accessor for ActivitySceneMetrics();
  v10 = -[ActivitySceneMetrics init](&v12, sel_init);

  return v10;
}

- (_TtC18ActivityUIServices20ActivitySceneMetrics)initWithSize:(CGSize)a3 cornerRadius:(double)a4
{
  void **v5;
  void *v6;
  objc_super v8;

  v5 = (void **)((char *)&self->super.isa + OBJC_IVAR____TtC18ActivityUIServices20ActivitySceneMetrics_edgeInsets);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC18ActivityUIServices20ActivitySceneMetrics_edgeInsets) = 0;
  *(CGSize *)((char *)&self->super.isa + OBJC_IVAR____TtC18ActivityUIServices20ActivitySceneMetrics_size) = a3;
  *(double *)((char *)&self->super.isa + OBJC_IVAR____TtC18ActivityUIServices20ActivitySceneMetrics_cornerRadius) = a4;
  swift_beginAccess();
  v6 = *v5;
  *v5 = 0;

  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for ActivitySceneMetrics();
  return -[ActivitySceneMetrics init](&v8, sel_init);
}

- (BOOL)isEqual:(id)a3
{
  _TtC18ActivityUIServices20ActivitySceneMetrics *v4;
  _TtC18ActivityUIServices20ActivitySceneMetrics *v5;
  char v6;
  _OWORD v8[2];

  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_22D84B7C0();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  v6 = sub_22D83CF60((uint64_t)v8);

  sub_22D814194((uint64_t)v8);
  return v6 & 1;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  _TtC18ActivityUIServices20ActivitySceneMetrics *v5;

  v4 = a3;
  v5 = self;
  sub_22D83D1C4(v4);

}

- (_TtC18ActivityUIServices20ActivitySceneMetrics)initWithCoder:(id)a3
{
  id v3;
  _TtC18ActivityUIServices20ActivitySceneMetrics *v4;

  v3 = a3;
  v4 = (_TtC18ActivityUIServices20ActivitySceneMetrics *)sub_22D83D818(v3);

  return v4;
}

- (NSString)description
{
  _TtC18ActivityUIServices20ActivitySceneMetrics *v2;
  void *v3;

  v2 = self;
  sub_22D83D474();

  v3 = (void *)sub_22D84B5BC();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (_TtC18ActivityUIServices20ActivitySceneMetrics)init
{
  _TtC18ActivityUIServices20ActivitySceneMetrics *result;

  result = (_TtC18ActivityUIServices20ActivitySceneMetrics *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

}

@end
