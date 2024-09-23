@implementation SystemApertureMetricsRequest

- (_TtC18ActivityUIServices26ActivityItemMetricsRequest)expandedMetricsRequest
{
  return (_TtC18ActivityUIServices26ActivityItemMetricsRequest *)*(id *)((char *)&self->super.isa + OBJC_IVAR____TtC18ActivityUIServices28SystemApertureMetricsRequest__expandedMetricsRequest);
}

- (void)setExpandedMetricsRequest:(id)a3
{
  sub_22D81E724(self, (uint64_t)a2, a3, &OBJC_IVAR____TtC18ActivityUIServices28SystemApertureMetricsRequest__expandedMetricsRequest);
}

- (_TtC18ActivityUIServices26ActivityItemMetricsRequest)compactLeadingMetricsRequest
{
  return (_TtC18ActivityUIServices26ActivityItemMetricsRequest *)*(id *)((char *)&self->super.isa + OBJC_IVAR____TtC18ActivityUIServices28SystemApertureMetricsRequest__compactLeadingMetricsRequest);
}

- (void)setCompactLeadingMetricsRequest:(id)a3
{
  sub_22D81E724(self, (uint64_t)a2, a3, &OBJC_IVAR____TtC18ActivityUIServices28SystemApertureMetricsRequest__compactLeadingMetricsRequest);
}

- (_TtC18ActivityUIServices26ActivityItemMetricsRequest)compactTrailingMetricsRequest
{
  return (_TtC18ActivityUIServices26ActivityItemMetricsRequest *)*(id *)((char *)&self->super.isa + OBJC_IVAR____TtC18ActivityUIServices28SystemApertureMetricsRequest__compactTrailingMetricsRequest);
}

- (void)setCompactTrailingMetricsRequest:(id)a3
{
  sub_22D81E724(self, (uint64_t)a2, a3, &OBJC_IVAR____TtC18ActivityUIServices28SystemApertureMetricsRequest__compactTrailingMetricsRequest);
}

- (_TtC18ActivityUIServices26ActivityItemMetricsRequest)minimalMetricsRequest
{
  return (_TtC18ActivityUIServices26ActivityItemMetricsRequest *)*(id *)((char *)&self->super.isa + OBJC_IVAR____TtC18ActivityUIServices28SystemApertureMetricsRequest__minimalMetricsRequest);
}

- (void)setMinimalMetricsRequest:(id)a3
{
  sub_22D81E724(self, (uint64_t)a2, a3, &OBJC_IVAR____TtC18ActivityUIServices28SystemApertureMetricsRequest__minimalMetricsRequest);
}

- (CGSize)obstructionSize
{
  double *v2;
  double v3;
  double v4;
  CGSize result;

  v2 = (double *)((char *)self + OBJC_IVAR____TtC18ActivityUIServices28SystemApertureMetricsRequest_obstructionSize);
  swift_beginAccess();
  v3 = *v2;
  v4 = v2[1];
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)setObstructionSize:(CGSize)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat *v5;

  height = a3.height;
  width = a3.width;
  v5 = (CGFloat *)((char *)self + OBJC_IVAR____TtC18ActivityUIServices28SystemApertureMetricsRequest_obstructionSize);
  swift_beginAccess();
  *v5 = width;
  v5[1] = height;
}

- (double)obstructionTopMargin
{
  double *v2;

  v2 = (double *)((char *)self + OBJC_IVAR____TtC18ActivityUIServices28SystemApertureMetricsRequest_obstructionTopMargin);
  swift_beginAccess();
  return *v2;
}

- (void)setObstructionTopMargin:(double)a3
{
  double *v4;

  v4 = (double *)((char *)self + OBJC_IVAR____TtC18ActivityUIServices28SystemApertureMetricsRequest_obstructionTopMargin);
  swift_beginAccess();
  *v4 = a3;
}

- (_TtC18ActivityUIServices28SystemApertureMetricsRequest)initWithObstructionSize:(CGSize)a3 obstructionTopMargin:(double)a4 expandedMetricsRequest:(id)a5 compactLeadingMetricsRequest:(id)a6 compactTrailingMetricsRequest:(id)a7 minimalMetricsRequest:(id)a8
{
  id v12;
  id v13;
  id v14;
  id v15;
  objc_super v17;

  *(CGSize *)((char *)&self->super.isa
            + OBJC_IVAR____TtC18ActivityUIServices28SystemApertureMetricsRequest_obstructionSize) = a3;
  *(double *)((char *)&self->super.isa
            + OBJC_IVAR____TtC18ActivityUIServices28SystemApertureMetricsRequest_obstructionTopMargin) = a4;
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC18ActivityUIServices28SystemApertureMetricsRequest__expandedMetricsRequest) = (Class)a5;
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC18ActivityUIServices28SystemApertureMetricsRequest__compactLeadingMetricsRequest) = (Class)a6;
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC18ActivityUIServices28SystemApertureMetricsRequest__compactTrailingMetricsRequest) = (Class)a7;
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC18ActivityUIServices28SystemApertureMetricsRequest__minimalMetricsRequest) = (Class)a8;
  v17.receiver = self;
  v17.super_class = (Class)type metadata accessor for SystemApertureMetricsRequest();
  v12 = a5;
  v13 = a6;
  v14 = a7;
  v15 = a8;
  return -[SystemApertureMetricsRequest init](&v17, sel_init);
}

- (_TtC18ActivityUIServices28SystemApertureMetricsRequest)initWithObstructionSize:(CGSize)a3 expandedMetricsRequest:(id)a4 compactLeadingMetricsRequest:(id)a5 compactTrailingMetricsRequest:(id)a6 minimalMetricsRequest:(id)a7
{
  return -[SystemApertureMetricsRequest initWithObstructionSize:obstructionTopMargin:expandedMetricsRequest:compactLeadingMetricsRequest:compactTrailingMetricsRequest:minimalMetricsRequest:](self, sel_initWithObstructionSize_obstructionTopMargin_expandedMetricsRequest_compactLeadingMetricsRequest_compactTrailingMetricsRequest_minimalMetricsRequest_, a4, a5, a6, a7, a3.width, a3.height, 0.0);
}

- (int64_t)hash
{
  _TtC18ActivityUIServices28SystemApertureMetricsRequest *v2;
  int64_t v3;

  v2 = self;
  v3 = sub_22D81F044();

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  _TtC18ActivityUIServices28SystemApertureMetricsRequest *v4;
  _TtC18ActivityUIServices28SystemApertureMetricsRequest *v5;
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
  v6 = sub_22D81F2B4((uint64_t)v8);

  sub_22D814194((uint64_t)v8);
  return v6;
}

- (NSString)description
{
  _TtC18ActivityUIServices28SystemApertureMetricsRequest *v2;
  void *v3;

  v2 = self;
  sub_22D81F5AC();

  v3 = (void *)sub_22D84B5BC();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (id)copyWithZone:(void *)a3
{
  _TtC18ActivityUIServices28SystemApertureMetricsRequest *v3;
  void *v4;
  _QWORD v6[4];

  v3 = self;
  sub_22D81F8A4(v6);

  __swift_project_boxed_opaque_existential_0(v6, v6[3]);
  v4 = (void *)sub_22D84B988();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v6);
  return v4;
}

- (_TtC18ActivityUIServices28SystemApertureMetricsRequest)initWithXPCDictionary:(id)a3
{
  _TtC18ActivityUIServices28SystemApertureMetricsRequest *v3;

  swift_unknownObjectRetain();
  v3 = (_TtC18ActivityUIServices28SystemApertureMetricsRequest *)sub_22D8200B0();
  swift_unknownObjectRelease();
  return v3;
}

- (void)encodeWithXPCDictionary:(id)a3
{
  _TtC18ActivityUIServices28SystemApertureMetricsRequest *v4;

  swift_unknownObjectRetain();
  v4 = self;
  sub_22D81FAF4();
  swift_unknownObjectRelease();

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  _TtC18ActivityUIServices28SystemApertureMetricsRequest *v5;

  v4 = a3;
  v5 = self;
  sub_22D81FC5C(v4);

}

- (_TtC18ActivityUIServices28SystemApertureMetricsRequest)initWithCoder:(id)a3
{
  id v3;
  _TtC18ActivityUIServices28SystemApertureMetricsRequest *v4;

  v3 = a3;
  v4 = (_TtC18ActivityUIServices28SystemApertureMetricsRequest *)sub_22D82039C(v3);

  return v4;
}

- (_TtC18ActivityUIServices28SystemApertureMetricsRequest)init
{
  _TtC18ActivityUIServices28SystemApertureMetricsRequest *result;

  result = (_TtC18ActivityUIServices28SystemApertureMetricsRequest *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC18ActivityUIServices28SystemApertureMetricsRequest__expandedMetricsRequest));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC18ActivityUIServices28SystemApertureMetricsRequest__compactLeadingMetricsRequest));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC18ActivityUIServices28SystemApertureMetricsRequest__compactTrailingMetricsRequest));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC18ActivityUIServices28SystemApertureMetricsRequest__minimalMetricsRequest));
}

@end
