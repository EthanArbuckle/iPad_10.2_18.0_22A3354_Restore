@implementation SingleValueAnnotationViewDataSource

- (_TtC15HealthRecordsUI35SingleValueAnnotationViewDataSource)init
{
  return (_TtC15HealthRecordsUI35SingleValueAnnotationViewDataSource *)SingleValueAnnotationViewDataSource.init()();
}

- (id)valueViewForColumnAtIndex:(int64_t)a3 orientation:(int64_t)a4
{
  return objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.isa
                                                 + OBJC_IVAR____TtC15HealthRecordsUI35SingleValueAnnotationViewDataSource_valueRangeGroup));
}

- (void)updateUsing:(id)a3
{
  id v4;
  _TtC15HealthRecordsUI35SingleValueAnnotationViewDataSource *v5;

  v4 = a3;
  v5 = self;
  sub_1BC349A74((uint64_t)v4);

}

- (void)updateUsing:(id)a3 valueRange:(id)a4 dateRange:(id)a5 timeScope:(int64_t)a6
{
  unint64_t v10;
  _QWORD *v11;
  void (*v12)(id, int64_t);
  id v13;
  id v14;
  _TtC15HealthRecordsUI35SingleValueAnnotationViewDataSource *v15;

  sub_1BC34B458();
  v10 = sub_1BC62C878();
  v11 = (_QWORD *)MEMORY[0x1E0DEEDD8];
  v12 = *(void (**)(id, int64_t))((*MEMORY[0x1E0DEEDD8] & (uint64_t)self->super.super.isa) + 0xB0);
  v13 = a4;
  v14 = a5;
  v15 = self;
  v12(v14, a6);
  sub_1BC34A010(v10, (void (*)(_QWORD))type metadata accessor for SingleValueChartData);
  (*(void (**)(void))((*v11 & (uint64_t)v15->super.super.isa) + 0x118))();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC15HealthRecordsUI35SingleValueAnnotationViewDataSource_valueRangeGroup));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC15HealthRecordsUI35SingleValueAnnotationViewDataSource_valueLabel));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC15HealthRecordsUI35SingleValueAnnotationViewDataSource_referenceRangeView));
  swift_bridgeObjectRelease();
}

@end
