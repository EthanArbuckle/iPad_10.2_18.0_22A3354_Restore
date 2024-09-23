@implementation JUWritingDirectionsCounts

- (unint64_t)natural
{
  return *(unint64_t *)((char *)&self->super.isa + OBJC_IVAR___JUWritingDirectionsCounts_natural);
}

- (unint64_t)leftToRight
{
  return *(unint64_t *)((char *)&self->super.isa + OBJC_IVAR___JUWritingDirectionsCounts_leftToRight);
}

- (unint64_t)rightToLeft
{
  return *(unint64_t *)((char *)&self->super.isa + OBJC_IVAR___JUWritingDirectionsCounts_rightToLeft);
}

- (unint64_t)total
{
  return *(unint64_t *)((char *)&self->super.isa + OBJC_IVAR___JUWritingDirectionsCounts_total);
}

- (unint64_t)significantValues
{
  return *(unint64_t *)((char *)&self->super.isa + OBJC_IVAR___JUWritingDirectionsCounts_significantValues);
}

- (BOOL)hasStronglyTypedCounts
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR___JUWritingDirectionsCounts_hasStronglyTypedCounts);
}

- (BOOL)isRTLEnough
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR___JUWritingDirectionsCounts_isRTLEnough);
}

- (BOOL)isRTLMinimal
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR___JUWritingDirectionsCounts_isRTLMinimal);
}

- (JUWritingDirectionsCounts)initWithNatural:(unint64_t)a3 leftToRight:(unint64_t)a4 rightToLeft:(unint64_t)a5
{
  return (JUWritingDirectionsCounts *)WritingDirectionsCounts.init(natural:leftToRight:rightToLeft:)((char *)a3, a4, a5);
}

- (BOOL)isEqual:(id)a3
{
  JUWritingDirectionsCounts *v4;
  JUWritingDirectionsCounts *v5;
  BOOL v6;
  _OWORD v8[2];

  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_1AC726724();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  v6 = sub_1AC6C4838((uint64_t)v8);

  sub_1AC690CC0((uint64_t)v8);
  return v6;
}

+ (id)add:(id)a3 to:(id)a4
{
  char *v5;
  id v6;
  char *v7;

  v5 = (char *)a3;
  v6 = a4;
  v7 = sub_1AC6C5208(v5, (uint64_t)v6);

  return v7;
}

+ (JUWritingDirectionsCounts)zero
{
  if (qword_1EEC8A200 != -1)
    swift_once();
  return (JUWritingDirectionsCounts *)(id)qword_1EEC8AEC0;
}

- (NSString)description
{
  JUWritingDirectionsCounts *v2;
  void *v3;

  v2 = self;
  sub_1AC6C4BB8();

  v3 = (void *)sub_1AC726208();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (JUWritingDirectionsCounts)init
{
  JUWritingDirectionsCounts *result;

  result = (JUWritingDirectionsCounts *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
