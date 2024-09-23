@implementation _SNTimeDurationConstraint

- (_SNTimeDurationConstraint)initWithEnumeratedDurations:(id)a3
{
  unint64_t v3;
  _SNTimeDurationConstraint *result;

  if (a3)
  {
    sub_1D42D6A2C();
    v3 = sub_1D451A92C();
  }
  else
  {
    v3 = 0;
  }
  sub_1D42D4034(v3);
  return result;
}

- (_SNTimeDurationConstraint)initWithDurationRange:(id *)a3
{
  int64_t var3;
  _SNTimeDurationConstraint *result;
  _OWORD v5[2];
  uint64_t v6;
  int64_t v7;

  var3 = a3->var1.var3;
  v5[0] = *(_OWORD *)&a3->var0.var0;
  v5[1] = *(_OWORD *)&a3->var0.var3;
  v6 = *(_QWORD *)&a3->var1.var1;
  v7 = var3;
  sub_1D42D4384(v5);
  return result;
}

- (id)copyWithZone:(void *)a3
{
  _SNTimeDurationConstraint *v3;
  void *v4;
  _QWORD v6[4];

  v3 = self;
  _SNTimeDurationConstraint.copy(with:)(v6);

  sub_1D42B5528(v6, v6[3]);
  v4 = (void *)sub_1D451B814();
  sub_1D42B5400((uint64_t)v6);
  return v4;
}

- (int64_t)hash
{
  _SNTimeDurationConstraint *v2;
  int64_t v3;
  int64_t v4;

  v2 = self;
  _SNTimeDurationConstraint.hash.getter();
  v4 = v3;

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  _SNTimeDurationConstraint *v4;
  _SNTimeDurationConstraint *v5;
  BOOL v6;
  _OWORD v8[2];

  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_1D451B208();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  v6 = _SNTimeDurationConstraint.isEqual(_:)((uint64_t)v8);

  sub_1D42D7018((uint64_t)v8, &qword_1EFE47160);
  return v6;
}

- (_SNTimeDurationConstraint)initWithCoder:(id)a3
{
  return (_SNTimeDurationConstraint *)_SNTimeDurationConstraint.init(coder:)(a3);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  _SNTimeDurationConstraint *v5;

  v4 = a3;
  v5 = self;
  _SNTimeDurationConstraint.encode(with:)((NSCoder)v4);

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (int64_t)type
{
  return sub_1D42D4A18();
}

- ($A0D62BC7BB322857EA05296DE7D5C3FF)durationRange
{
  $A0D62BC7BB322857EA05296DE7D5C3FF *result;
  int64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  _QWORD v9[2];
  __int128 v10;
  uint64_t v11;
  int64_t v12;

  sub_1D42D4A90((uint64_t)v9);
  v5 = v12;
  v6 = v9[1];
  v7 = v11;
  v8 = v10;
  retstr->var0.var0 = v9[0];
  *(_QWORD *)&retstr->var0.var1 = v6;
  *(_OWORD *)&retstr->var0.var3 = v8;
  *(_QWORD *)&retstr->var1.var1 = v7;
  retstr->var1.var3 = v5;
  return result;
}

- (NSArray)enumeratedDurations
{
  _SNTimeDurationConstraint *v2;
  void *v3;

  v2 = self;
  sub_1D42D4B34();

  sub_1D42D6A2C();
  v3 = (void *)sub_1D451A908();
  swift_bridgeObjectRelease();
  return (NSArray *)v3;
}

- (_SNTimeDurationConstraint)init
{
  _SNTimeDurationConstraint.init()();
}

- (void).cxx_destruct
{
  sub_1D42B5C4C(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____SNTimeDurationConstraint_impl), *(_QWORD *)&self->impl[OBJC_IVAR____SNTimeDurationConstraint_impl], *(_QWORD *)&self->impl[OBJC_IVAR____SNTimeDurationConstraint_impl + 8], *(_QWORD *)&self->impl[OBJC_IVAR____SNTimeDurationConstraint_impl + 16], *(_QWORD *)&self->impl[OBJC_IVAR____SNTimeDurationConstraint_impl + 24], *(_QWORD *)&self->impl[OBJC_IVAR____SNTimeDurationConstraint_impl + 32], self->impl[OBJC_IVAR____SNTimeDurationConstraint_impl + 40]);
}

@end
