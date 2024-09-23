@implementation ActivityItemMetricsRequest

- (_TtC18ActivityUIServices20SizeDimensionRequest)widthRequest
{
  return (_TtC18ActivityUIServices20SizeDimensionRequest *)*(id *)((char *)&self->super.isa + OBJC_IVAR____TtC18ActivityUIServices26ActivityItemMetricsRequest__widthRequest);
}

- (void)setWidthRequest:(id)a3
{
  sub_22D842554(self, (uint64_t)a2, a3, &OBJC_IVAR____TtC18ActivityUIServices26ActivityItemMetricsRequest__widthRequest);
}

- (_TtC18ActivityUIServices20SizeDimensionRequest)heightRequest
{
  return (_TtC18ActivityUIServices20SizeDimensionRequest *)*(id *)((char *)&self->super.isa + OBJC_IVAR____TtC18ActivityUIServices26ActivityItemMetricsRequest__heightRequest);
}

- (void)setHeightRequest:(id)a3
{
  sub_22D842554(self, (uint64_t)a2, a3, &OBJC_IVAR____TtC18ActivityUIServices26ActivityItemMetricsRequest__heightRequest);
}

- (double)cornerRadius
{
  double *v2;

  v2 = (double *)((char *)self + OBJC_IVAR____TtC18ActivityUIServices26ActivityItemMetricsRequest_cornerRadius);
  swift_beginAccess();
  return *v2;
}

- (void)setCornerRadius:(double)a3
{
  double *v4;

  v4 = (double *)((char *)self + OBJC_IVAR____TtC18ActivityUIServices26ActivityItemMetricsRequest_cornerRadius);
  swift_beginAccess();
  *v4 = a3;
}

- (double)clipMargin
{
  double *v2;

  v2 = (double *)((char *)self + OBJC_IVAR____TtC18ActivityUIServices26ActivityItemMetricsRequest_clipMargin);
  swift_beginAccess();
  return *v2;
}

- (void)setClipMargin:(double)a3
{
  double *v4;

  v4 = (double *)((char *)self + OBJC_IVAR____TtC18ActivityUIServices26ActivityItemMetricsRequest_clipMargin);
  swift_beginAccess();
  *v4 = a3;
}

- (double)scaleFactor
{
  double *v2;

  v2 = (double *)((char *)self + OBJC_IVAR____TtC18ActivityUIServices26ActivityItemMetricsRequest_scaleFactor);
  swift_beginAccess();
  return *v2;
}

- (void)setScaleFactor:(double)a3
{
  double *v4;

  v4 = (double *)((char *)self + OBJC_IVAR____TtC18ActivityUIServices26ActivityItemMetricsRequest_scaleFactor);
  swift_beginAccess();
  *v4 = a3;
}

- (NSNumber)watchDisplayVariant
{
  id *v2;

  v2 = (id *)((char *)&self->super.isa
            + OBJC_IVAR____TtC18ActivityUIServices26ActivityItemMetricsRequest_watchDisplayVariant);
  swift_beginAccess();
  return (NSNumber *)*v2;
}

- (void)setWatchDisplayVariant:(id)a3
{
  void **v4;
  void *v5;
  id v6;

  v4 = (void **)((char *)&self->super.isa
               + OBJC_IVAR____TtC18ActivityUIServices26ActivityItemMetricsRequest_watchDisplayVariant);
  swift_beginAccess();
  v5 = *v4;
  *v4 = a3;
  v6 = a3;

}

- (_TtC18ActivityUIServices18ActivityEdgeInsets)edgeInsets
{
  return (_TtC18ActivityUIServices18ActivityEdgeInsets *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                                                 + OBJC_IVAR____TtC18ActivityUIServices26ActivityItemMetricsRequest__edgeInsets));
}

- (void)setEdgeInsets:(id)a3
{
  _TtC18ActivityUIServices26ActivityItemMetricsRequest *v5;
  id v6;

  v6 = a3;
  v5 = self;
  sub_22D844EE8(a3);

}

- (CGSize)initialSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = sub_22D843120();
  result.height = v3;
  result.width = v2;
  return result;
}

- (CGSize)maximumSize
{
  double v3;
  double *v4;
  double v5;
  double v6;
  CGSize result;

  v3 = *(double *)(*(char **)((char *)&self->super.isa
                            + OBJC_IVAR____TtC18ActivityUIServices26ActivityItemMetricsRequest__widthRequest)
                 + OBJC_IVAR____TtC18ActivityUIServices20SizeDimensionRequest_maximum);
  v4 = (double *)((char *)self + OBJC_IVAR____TtC18ActivityUIServices26ActivityItemMetricsRequest_scaleFactor);
  swift_beginAccess();
  v5 = v3 * *v4;
  v6 = *v4
     * *(double *)(*(char **)((char *)&self->super.isa
                            + OBJC_IVAR____TtC18ActivityUIServices26ActivityItemMetricsRequest__heightRequest)
                 + OBJC_IVAR____TtC18ActivityUIServices20SizeDimensionRequest_maximum);
  result.height = v6;
  result.width = v5;
  return result;
}

- (_TtC18ActivityUIServices26ActivityItemMetricsRequest)initWithWidth:(id)a3 height:(id)a4 cornerRadius:(double)a5
{
  return -[ActivityItemMetricsRequest initWithWidth:height:cornerRadius:edgeInsets:clipMargin:scaleFactor:](self, sel_initWithWidth_height_cornerRadius_edgeInsets_clipMargin_scaleFactor_, a3, a4, 0, a5, 0.0, 1.0);
}

- (_TtC18ActivityUIServices26ActivityItemMetricsRequest)initWithWidth:(id)a3 height:(id)a4 cornerRadius:(double)a5 watchDisplayVariant:(id)a6
{
  return -[ActivityItemMetricsRequest initWithWidth:height:cornerRadius:edgeInsets:clipMargin:scaleFactor:watchDisplayVariant:](self, sel_initWithWidth_height_cornerRadius_edgeInsets_clipMargin_scaleFactor_watchDisplayVariant_, a3, a4, 0, a6, a5, 0.0, 1.0);
}

- (_TtC18ActivityUIServices26ActivityItemMetricsRequest)initWithWidth:(id)a3 height:(id)a4 cornerRadius:(double)a5 edgeInsets:(id)a6
{
  return -[ActivityItemMetricsRequest initWithWidth:height:cornerRadius:edgeInsets:clipMargin:scaleFactor:](self, sel_initWithWidth_height_cornerRadius_edgeInsets_clipMargin_scaleFactor_, a3, a4, a6, a5, 0.0, 1.0);
}

- (_TtC18ActivityUIServices26ActivityItemMetricsRequest)initWithWidth:(id)a3 height:(id)a4 cornerRadius:(double)a5 edgeInsets:(id)a6 clipMargin:(double)a7
{
  return -[ActivityItemMetricsRequest initWithWidth:height:cornerRadius:edgeInsets:clipMargin:scaleFactor:](self, sel_initWithWidth_height_cornerRadius_edgeInsets_clipMargin_scaleFactor_, a3, a4, a6, a5, a7, 1.0);
}

- (_TtC18ActivityUIServices26ActivityItemMetricsRequest)initWithWidth:(id)a3 height:(id)a4 cornerRadius:(double)a5 edgeInsets:(id)a6 clipMargin:(double)a7 scaleFactor:(double)a8
{
  return -[ActivityItemMetricsRequest initWithWidth:height:cornerRadius:edgeInsets:clipMargin:scaleFactor:watchDisplayVariant:](self, sel_initWithWidth_height_cornerRadius_edgeInsets_clipMargin_scaleFactor_watchDisplayVariant_, a3, a4, a6, 0, a5, a7, a8);
}

- (_TtC18ActivityUIServices26ActivityItemMetricsRequest)initWithWidth:(id)a3 height:(id)a4 cornerRadius:(double)a5 edgeInsets:(id)a6 clipMargin:(double)a7 scaleFactor:(double)a8 watchDisplayVariant:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  _TtC18ActivityUIServices26ActivityItemMetricsRequest *v19;

  v15 = a3;
  v16 = a4;
  v17 = a6;
  v18 = a9;
  v19 = (_TtC18ActivityUIServices26ActivityItemMetricsRequest *)sub_22D844F7C(v15, v16, a6, a9, a5, a7, a8);

  return v19;
}

- (BOOL)isValid
{
  return sub_22D843A58();
}

- (int64_t)hash
{
  _TtC18ActivityUIServices26ActivityItemMetricsRequest *v2;
  int64_t v3;

  v2 = self;
  v3 = sub_22D843B40();

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  _TtC18ActivityUIServices26ActivityItemMetricsRequest *v4;
  _TtC18ActivityUIServices26ActivityItemMetricsRequest *v5;
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
  v6 = sub_22D843D18((uint64_t)v8);

  sub_22D814194((uint64_t)v8);
  return v6 & 1;
}

- (NSString)description
{
  _TtC18ActivityUIServices26ActivityItemMetricsRequest *v2;
  void *v3;

  v2 = self;
  sub_22D844104();

  v3 = (void *)sub_22D84B5BC();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (void)encodeWithXPCDictionary:(id)a3
{
  _TtC18ActivityUIServices26ActivityItemMetricsRequest *v5;

  swift_unknownObjectRetain();
  v5 = self;
  sub_22D844464(a3);
  swift_unknownObjectRelease();

}

- (_TtC18ActivityUIServices26ActivityItemMetricsRequest)initWithXPCDictionary:(id)a3
{
  _TtC18ActivityUIServices26ActivityItemMetricsRequest *v4;

  swift_unknownObjectRetain();
  v4 = (_TtC18ActivityUIServices26ActivityItemMetricsRequest *)sub_22D8451D8(a3);
  swift_unknownObjectRelease();
  return v4;
}

- (id)copyWithZone:(void *)a3
{
  _TtC18ActivityUIServices26ActivityItemMetricsRequest *v3;
  void *v4;
  _QWORD v6[4];

  v3 = self;
  sub_22D844748(v6);

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
  _TtC18ActivityUIServices26ActivityItemMetricsRequest *v5;

  v4 = a3;
  v5 = self;
  sub_22D84492C(v4);

}

- (_TtC18ActivityUIServices26ActivityItemMetricsRequest)initWithCoder:(id)a3
{
  id v3;
  _TtC18ActivityUIServices26ActivityItemMetricsRequest *v4;

  v3 = a3;
  v4 = (_TtC18ActivityUIServices26ActivityItemMetricsRequest *)sub_22D8455E4(v3);

  return v4;
}

- (_TtC18ActivityUIServices26ActivityItemMetricsRequest)init
{
  _TtC18ActivityUIServices26ActivityItemMetricsRequest *result;

  result = (_TtC18ActivityUIServices26ActivityItemMetricsRequest *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC18ActivityUIServices26ActivityItemMetricsRequest__widthRequest));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC18ActivityUIServices26ActivityItemMetricsRequest__heightRequest));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC18ActivityUIServices26ActivityItemMetricsRequest_watchDisplayVariant));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC18ActivityUIServices26ActivityItemMetricsRequest__edgeInsets));
}

@end
