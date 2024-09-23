@implementation BDSReadingHistoryUpdateInfo

- (BDSReadingHistoryUpdate)update
{
  return (BDSReadingHistoryUpdate *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                            + OBJC_IVAR___BDSReadingHistoryUpdateInfo_update));
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BDSReadingHistoryUpdateInfo)initWithCoder:(id)a3
{
  id v4;
  BDSReadingHistoryUpdateInfo *v5;
  BDSReadingHistoryUpdateInfo *result;
  BDSReadingHistoryUpdateInfo *v7;
  objc_super v8;

  v4 = a3;
  v5 = self;
  result = (BDSReadingHistoryUpdateInfo *)sub_227DCF4DC(v4);
  if (result)
  {
    *(Class *)((char *)&v5->super.isa + OBJC_IVAR___BDSReadingHistoryUpdateInfo_update) = (Class)result;

    v8.receiver = v5;
    v8.super_class = (Class)BDSReadingHistoryUpdateInfo;
    v7 = -[BDSReadingHistoryUpdateInfo init](&v8, sel_init);

    return v7;
  }
  else
  {
    __break(1u);
  }
  return result;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  BDSReadingHistoryUpdateInfo *v5;
  BDSReadingHistoryUpdate *v6;

  v4 = a3;
  v5 = self;
  v6 = -[BDSReadingHistoryUpdateInfo update](v5, sel_update);
  sub_227DCF738(v4);

}

- (BDSReadingHistoryUpdateInfo)initWithUpdate:(id)a3
{
  id v3;
  objc_super v5;

  *(Class *)((char *)&self->super.isa + OBJC_IVAR___BDSReadingHistoryUpdateInfo_update) = (Class)a3;
  v5.receiver = self;
  v5.super_class = (Class)BDSReadingHistoryUpdateInfo;
  v3 = a3;
  return -[BDSReadingHistoryUpdateInfo init](&v5, sel_init);
}

- (NSString)description
{
  BDSReadingHistoryUpdateInfo *v2;
  BDSReadingHistoryUpdate *v3;
  void *v4;

  v2 = self;
  v3 = -[BDSReadingHistoryUpdateInfo update](v2, sel_update);
  ReadingHistoryUpdate.description.getter();

  v4 = (void *)sub_227E5FF78();
  swift_bridgeObjectRelease();
  return (NSString *)v4;
}

- (BDSReadingHistoryUpdateInfo)init
{
  BDSReadingHistoryUpdateInfo *result;

  result = (BDSReadingHistoryUpdateInfo *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

}

@end
