@implementation AMPWritingDirectionsCounts

- (unint64_t)natural
{
  return *(unint64_t *)((char *)&self->super.isa + OBJC_IVAR___AMPWritingDirectionsCounts_natural);
}

- (unint64_t)leftToRight
{
  return *(unint64_t *)((char *)&self->super.isa + OBJC_IVAR___AMPWritingDirectionsCounts_leftToRight);
}

- (unint64_t)rightToLeft
{
  return *(unint64_t *)((char *)&self->super.isa + OBJC_IVAR___AMPWritingDirectionsCounts_rightToLeft);
}

- (unint64_t)total
{
  return *(unint64_t *)((char *)&self->super.isa + OBJC_IVAR___AMPWritingDirectionsCounts_total);
}

- (unint64_t)significantValues
{
  return *(unint64_t *)((char *)&self->super.isa + OBJC_IVAR___AMPWritingDirectionsCounts_significantValues);
}

- (BOOL)hasStronglyTypedCounts
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR___AMPWritingDirectionsCounts_hasStronglyTypedCounts);
}

- (BOOL)isRTLEnough
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR___AMPWritingDirectionsCounts_isRTLEnough);
}

- (BOOL)isRTLMinimal
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR___AMPWritingDirectionsCounts_isRTLMinimal);
}

- (AMPWritingDirectionsCounts)initWithNatural:(unint64_t)a3 leftToRight:(unint64_t)a4 rightToLeft:(unint64_t)a5
{
  return (AMPWritingDirectionsCounts *)WritingDirectionsCounts.init(natural:leftToRight:rightToLeft:)((char *)a3, a4, a5);
}

- (BOOL)isEqual:(id)a3
{
  AMPWritingDirectionsCounts *v4;
  AMPWritingDirectionsCounts *v5;
  BOOL v6;
  _OWORD v8[2];

  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_1D82158F8();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  v6 = sub_1D82131B4((uint64_t)v8);

  sub_1D820DA2C((uint64_t)v8);
  return v6;
}

+ (id)add:(id)a3 to:(id)a4
{
  char *v5;
  id v6;
  char *v7;

  v5 = (char *)a3;
  v6 = a4;
  v7 = sub_1D8213B84(v5, (uint64_t)v6);

  return v7;
}

+ (AMPWritingDirectionsCounts)zero
{
  if (qword_1EDA1C2B0 != -1)
    swift_once();
  return (AMPWritingDirectionsCounts *)(id)qword_1EDA1BCC8;
}

- (NSString)description
{
  AMPWritingDirectionsCounts *v2;
  void *v3;

  v2 = self;
  sub_1D8213534();

  v3 = (void *)sub_1D82156AC();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (AMPWritingDirectionsCounts)init
{
  AMPWritingDirectionsCounts *result;

  result = (AMPWritingDirectionsCounts *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
