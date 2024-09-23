@implementation ActivityEdgeInsets

- (double)top
{
  double *v2;

  v2 = (double *)((char *)self + OBJC_IVAR____TtC18ActivityUIServices18ActivityEdgeInsets_top);
  swift_beginAccess();
  return *v2;
}

- (void)setTop:(double)a3
{
  double *v4;

  v4 = (double *)((char *)self + OBJC_IVAR____TtC18ActivityUIServices18ActivityEdgeInsets_top);
  swift_beginAccess();
  *v4 = a3;
}

- (double)leading
{
  double *v2;

  v2 = (double *)((char *)self + OBJC_IVAR____TtC18ActivityUIServices18ActivityEdgeInsets_leading);
  swift_beginAccess();
  return *v2;
}

- (void)setLeading:(double)a3
{
  double *v4;

  v4 = (double *)((char *)self + OBJC_IVAR____TtC18ActivityUIServices18ActivityEdgeInsets_leading);
  swift_beginAccess();
  *v4 = a3;
}

- (double)bottom
{
  double *v2;

  v2 = (double *)((char *)self + OBJC_IVAR____TtC18ActivityUIServices18ActivityEdgeInsets_bottom);
  swift_beginAccess();
  return *v2;
}

- (void)setBottom:(double)a3
{
  double *v4;

  v4 = (double *)((char *)self + OBJC_IVAR____TtC18ActivityUIServices18ActivityEdgeInsets_bottom);
  swift_beginAccess();
  *v4 = a3;
}

- (double)trailing
{
  double *v2;

  v2 = (double *)((char *)self + OBJC_IVAR____TtC18ActivityUIServices18ActivityEdgeInsets_trailing);
  swift_beginAccess();
  return *v2;
}

- (void)setTrailing:(double)a3
{
  double *v4;

  v4 = (double *)((char *)self + OBJC_IVAR____TtC18ActivityUIServices18ActivityEdgeInsets_trailing);
  swift_beginAccess();
  *v4 = a3;
}

- (_TtC18ActivityUIServices18ActivityEdgeInsets)init
{
  objc_super v3;

  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC18ActivityUIServices18ActivityEdgeInsets_top) = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC18ActivityUIServices18ActivityEdgeInsets_leading) = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC18ActivityUIServices18ActivityEdgeInsets_bottom) = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC18ActivityUIServices18ActivityEdgeInsets_trailing) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for ActivityEdgeInsets();
  return -[ActivityEdgeInsets init](&v3, sel_init);
}

- (_TtC18ActivityUIServices18ActivityEdgeInsets)initWithTop:(double)a3 leading:(double)a4 bottom:(double)a5 trailing:(double)a6
{
  _TtC18ActivityUIServices18ActivityEdgeInsets *v10;
  double *v11;
  double *v12;
  double *v13;
  double *v14;

  v10 = -[ActivityEdgeInsets init](self, sel_init);
  v11 = (double *)((char *)v10 + OBJC_IVAR____TtC18ActivityUIServices18ActivityEdgeInsets_top);
  swift_beginAccess();
  *v11 = a3;
  v12 = (double *)((char *)v10 + OBJC_IVAR____TtC18ActivityUIServices18ActivityEdgeInsets_leading);
  swift_beginAccess();
  *v12 = a4;
  v13 = (double *)((char *)v10 + OBJC_IVAR____TtC18ActivityUIServices18ActivityEdgeInsets_bottom);
  swift_beginAccess();
  *v13 = a5;
  v14 = (double *)((char *)v10 + OBJC_IVAR____TtC18ActivityUIServices18ActivityEdgeInsets_trailing);
  swift_beginAccess();
  *v14 = a6;
  return v10;
}

- (int64_t)hash
{
  return sub_22D836BC8();
}

- (BOOL)isEqual:(id)a3
{
  _TtC18ActivityUIServices18ActivityEdgeInsets *v4;
  _TtC18ActivityUIServices18ActivityEdgeInsets *v5;
  BOOL v6;
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
  v6 = sub_22D836D14((uint64_t)v8);

  sub_22D814194((uint64_t)v8);
  return v6;
}

- (NSString)description
{
  _TtC18ActivityUIServices18ActivityEdgeInsets *v2;
  void *v3;

  v2 = self;
  sub_22D836F94();

  v3 = (void *)sub_22D84B5BC();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (id)copyWithZone:(void *)a3
{
  _TtC18ActivityUIServices18ActivityEdgeInsets *v3;
  void *v4;
  _QWORD v6[4];

  v3 = self;
  sub_22D837150(v6);

  __swift_project_boxed_opaque_existential_0(v6, v6[3]);
  v4 = (void *)sub_22D84B988();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v6);
  return v4;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  _TtC18ActivityUIServices18ActivityEdgeInsets *v5;

  swift_unknownObjectRetain();
  v5 = self;
  sub_22D837334(a3);
  swift_unknownObjectRelease();

}

- (_TtC18ActivityUIServices18ActivityEdgeInsets)initWithBSXPCCoder:(id)a3
{
  _TtC18ActivityUIServices18ActivityEdgeInsets *v4;

  swift_unknownObjectRetain();
  v4 = (_TtC18ActivityUIServices18ActivityEdgeInsets *)sub_22D8376F8(a3);
  swift_unknownObjectRelease();
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  _TtC18ActivityUIServices18ActivityEdgeInsets *v5;

  v4 = a3;
  v5 = self;
  sub_22D837334(v4);

}

- (_TtC18ActivityUIServices18ActivityEdgeInsets)initWithCoder:(id)a3
{
  id v3;
  _TtC18ActivityUIServices18ActivityEdgeInsets *v4;

  v3 = a3;
  v4 = (_TtC18ActivityUIServices18ActivityEdgeInsets *)sub_22D8376F8(v3);

  return v4;
}

@end
