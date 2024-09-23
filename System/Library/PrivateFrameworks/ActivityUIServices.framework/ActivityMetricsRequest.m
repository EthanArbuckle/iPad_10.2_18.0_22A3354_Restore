@implementation ActivityMetricsRequest

- (_TtC18ActivityUIServices26ActivityItemMetricsRequest)ambientMetrics
{
  return (_TtC18ActivityUIServices26ActivityItemMetricsRequest *)*(id *)((char *)&self->super.isa + OBJC_IVAR____TtC18ActivityUIServices22ActivityMetricsRequest__ambientMetrics);
}

- (void)setAmbientMetrics:(id)a3
{
  _TtC18ActivityUIServices22ActivityMetricsRequest *v5;
  id v6;

  v6 = a3;
  v5 = self;
  sub_22D813F1C(a3, (void (*)(_QWORD))type metadata accessor for ActivityItemMetricsRequest, &OBJC_IVAR____TtC18ActivityUIServices22ActivityMetricsRequest__ambientMetrics);

}

- (_TtC18ActivityUIServices26ActivityItemMetricsRequest)lockScreenMetrics
{
  return (_TtC18ActivityUIServices26ActivityItemMetricsRequest *)*(id *)((char *)&self->super.isa + OBJC_IVAR____TtC18ActivityUIServices22ActivityMetricsRequest__lockScreenMetrics);
}

- (void)setLockScreenMetrics:(id)a3
{
  id v4;
  _TtC18ActivityUIServices22ActivityMetricsRequest *v5;
  void *v6;
  objc_class *v7;

  v4 = a3;
  v5 = self;
  objc_msgSend(v4, sel_copy);
  sub_22D84B7C0();
  swift_unknownObjectRelease();
  type metadata accessor for ActivityItemMetricsRequest();
  swift_dynamicCast();
  v6 = *(Class *)((char *)&v5->super.isa
                + OBJC_IVAR____TtC18ActivityUIServices22ActivityMetricsRequest__lockScreenMetrics);
  *(Class *)((char *)&v5->super.isa + OBJC_IVAR____TtC18ActivityUIServices22ActivityMetricsRequest__lockScreenMetrics) = v7;

}

- (_TtC18ActivityUIServices28SystemApertureMetricsRequest)systemApertureMetrics
{
  return (_TtC18ActivityUIServices28SystemApertureMetricsRequest *)*(id *)((char *)&self->super.isa + OBJC_IVAR____TtC18ActivityUIServices22ActivityMetricsRequest__systemApertureMetrics);
}

- (void)setSystemApertureMetrics:(id)a3
{
  _TtC18ActivityUIServices22ActivityMetricsRequest *v5;
  id v6;

  v6 = a3;
  v5 = self;
  sub_22D813F1C(a3, (void (*)(_QWORD))type metadata accessor for SystemApertureMetricsRequest, &OBJC_IVAR____TtC18ActivityUIServices22ActivityMetricsRequest__systemApertureMetrics);

}

- (_TtC18ActivityUIServices22ActivityMetricsRequest)initWithLockScreenMetrics:(id)a3 systemApertureMetrics:(id)a4 ambientMetrics:(id)a5
{
  id v7;
  id v8;
  id v9;
  _TtC18ActivityUIServices22ActivityMetricsRequest *v10;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = (_TtC18ActivityUIServices22ActivityMetricsRequest *)sub_22D813FBC(v7, a4, a5);

  return v10;
}

- (_TtC18ActivityUIServices22ActivityMetricsRequest)initWithLockScreenMetrics:(id)a3 systemApertureMetrics:(id)a4
{
  id v5;
  id v6;
  _TtC18ActivityUIServices22ActivityMetricsRequest *v7;

  v5 = a3;
  v6 = a4;
  v7 = (_TtC18ActivityUIServices22ActivityMetricsRequest *)sub_22D81406C(v5, a4);

  return v7;
}

- (int64_t)hash
{
  _TtC18ActivityUIServices22ActivityMetricsRequest *v2;
  int64_t v3;

  v2 = self;
  v3 = sub_22D813358();

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  _TtC18ActivityUIServices22ActivityMetricsRequest *v4;
  _TtC18ActivityUIServices22ActivityMetricsRequest *v5;
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
  v6 = sub_22D81341C((uint64_t)v8);

  sub_22D814194((uint64_t)v8);
  return v6 & 1;
}

- (NSString)description
{
  _TtC18ActivityUIServices22ActivityMetricsRequest *v2;
  void *v3;

  v2 = self;
  sub_22D813684();

  v3 = (void *)sub_22D84B5BC();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (_TtC18ActivityUIServices22ActivityMetricsRequest)initWithXPCDictionary:(id)a3
{
  _TtC18ActivityUIServices22ActivityMetricsRequest *v3;

  swift_unknownObjectRetain();
  v3 = (_TtC18ActivityUIServices22ActivityMetricsRequest *)sub_22D814230();
  swift_unknownObjectRelease();
  return v3;
}

- (void)encodeWithXPCDictionary:(id)a3
{
  _TtC18ActivityUIServices22ActivityMetricsRequest *v5;

  swift_unknownObjectRetain();
  v5 = self;
  sub_22D8138EC((uint64_t)a3);
  swift_unknownObjectRelease();

}

- (id)copyWithZone:(void *)a3
{
  _TtC18ActivityUIServices22ActivityMetricsRequest *v3;
  void *v4;
  _QWORD v6[4];

  v3 = self;
  sub_22D8139BC(v6);

  __swift_project_boxed_opaque_existential_0(v6, v6[3]);
  v4 = (void *)sub_22D84B988();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v6);
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  _TtC18ActivityUIServices22ActivityMetricsRequest *v5;

  v4 = a3;
  v5 = self;
  sub_22D813B38(v4);

}

- (_TtC18ActivityUIServices22ActivityMetricsRequest)initWithCoder:(id)a3
{
  id v3;
  _TtC18ActivityUIServices22ActivityMetricsRequest *v4;

  v3 = a3;
  v4 = (_TtC18ActivityUIServices22ActivityMetricsRequest *)sub_22D814474(v3);

  return v4;
}

- (_TtC18ActivityUIServices22ActivityMetricsRequest)init
{
  _TtC18ActivityUIServices22ActivityMetricsRequest *result;

  result = (_TtC18ActivityUIServices22ActivityMetricsRequest *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC18ActivityUIServices22ActivityMetricsRequest__ambientMetrics));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC18ActivityUIServices22ActivityMetricsRequest__lockScreenMetrics));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC18ActivityUIServices22ActivityMetricsRequest__systemApertureMetrics));
}

@end
