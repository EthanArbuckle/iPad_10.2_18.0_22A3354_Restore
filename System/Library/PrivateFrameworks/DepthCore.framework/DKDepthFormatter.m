@implementation DKDepthFormatter

- (DKDepthFormatter)init
{
  DKDepthFormatter *result;

  result = (DKDepthFormatter *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  _OWORD v8[10];

  v3 = *(_OWORD *)&self->configuration[OBJC_IVAR___DKDepthFormatter_configuration + 72];
  v8[6] = *(_OWORD *)&self->configuration[OBJC_IVAR___DKDepthFormatter_configuration + 56];
  v8[7] = v3;
  v4 = *(_OWORD *)&self->configuration[OBJC_IVAR___DKDepthFormatter_configuration + 104];
  v8[8] = *(_OWORD *)&self->configuration[OBJC_IVAR___DKDepthFormatter_configuration + 88];
  v8[9] = v4;
  v5 = *(_OWORD *)&self->configuration[OBJC_IVAR___DKDepthFormatter_configuration + 8];
  v8[2] = *(_OWORD *)&self->depthIntegerMeasurementFormatter[OBJC_IVAR___DKDepthFormatter_configuration];
  v8[3] = v5;
  v6 = *(_OWORD *)&self->configuration[OBJC_IVAR___DKDepthFormatter_configuration + 40];
  v8[4] = *(_OWORD *)&self->configuration[OBJC_IVAR___DKDepthFormatter_configuration + 24];
  v8[5] = v6;
  v7 = *(_OWORD *)&self->depthMeasurementFormatter[OBJC_IVAR___DKDepthFormatter_configuration];
  v8[0] = *(_OWORD *)((char *)&self->super.isa + OBJC_IVAR___DKDepthFormatter_configuration);
  v8[1] = v7;
  sub_23A379404((uint64_t)v8, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD))sub_23A379608, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_23A379490);

  sub_23A37F8E0((uint64_t)self + OBJC_IVAR___DKDepthFormatter____lazy_storage___decimalDigitsAndPunctuationSet);
}

@end
