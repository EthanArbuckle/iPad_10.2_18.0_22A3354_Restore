@implementation SNDirectionOfArrivalResult

- ($A0D62BC7BB322857EA05296DE7D5C3FF)timeRange
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

  SNDirectionOfArrivalResult.timeRange.getter((uint64_t)v9);
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

- (void)setTimeRange:(id *)a3
{
  int64_t var3;
  _QWORD v4[2];
  __int128 v5;
  uint64_t v6;
  int64_t v7;

  var3 = a3->var1.var3;
  v4[0] = a3->var0.var0;
  v4[1] = *(_QWORD *)&a3->var0.var1;
  v5 = *(_OWORD *)&a3->var0.var3;
  v6 = *(_QWORD *)&a3->var1.var1;
  v7 = var3;
  SNDirectionOfArrivalResult.timeRange.setter((uint64_t)v4);
}

- (float)azimuth
{
  return SNDirectionOfArrivalResult.azimuth.getter();
}

- (void)setAzimuth:(float)a3
{
  SNDirectionOfArrivalResult.azimuth.setter(a3);
}

- (float)elevation
{
  return SNDirectionOfArrivalResult.elevation.getter();
}

- (void)setElevation:(float)a3
{
  SNDirectionOfArrivalResult.elevation.setter(a3);
}

- (NSArray)spatialSpectrum
{
  SNDirectionOfArrivalResult *v2;
  void *v3;

  v2 = self;
  SNDirectionOfArrivalResult.spatialSpectrum.getter();

  sub_1D432BEDC();
  v3 = (void *)sub_1D451A908();
  swift_bridgeObjectRelease();
  return (NSArray *)v3;
}

- (void)setSpatialSpectrum:(id)a3
{
  unint64_t v4;
  SNDirectionOfArrivalResult *v5;

  sub_1D432BEDC();
  v4 = sub_1D451A92C();
  v5 = self;
  SNDirectionOfArrivalResult.spatialSpectrum.setter(v4);

}

- (SNDirectionOfArrivalResult)init
{
  return (SNDirectionOfArrivalResult *)sub_1D432B4D8();
}

- (id)copyWithZone:(void *)a3
{
  SNDirectionOfArrivalResult *v3;
  void *v4;
  _QWORD v6[4];

  v3 = self;
  SNDirectionOfArrivalResult.copy(with:)(v6);

  sub_1D42B5528(v6, v6[3]);
  v4 = (void *)sub_1D451B814();
  sub_1D42B5400((uint64_t)v6);
  return v4;
}

- (int64_t)hash
{
  SNDirectionOfArrivalResult *v2;
  int64_t v3;

  v2 = self;
  v3 = SNDirectionOfArrivalResult.hash.getter();

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  SNDirectionOfArrivalResult *v4;
  SNDirectionOfArrivalResult *v5;
  char v6;
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
  v6 = SNDirectionOfArrivalResult.isEqual(_:)((uint64_t)v8);

  sub_1D42B5464((uint64_t)v8);
  return v6 & 1;
}

- (SNDirectionOfArrivalResult)initWithCoder:(id)a3
{
  return (SNDirectionOfArrivalResult *)SNDirectionOfArrivalResult.init(coder:)(a3);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  SNDirectionOfArrivalResult *v5;

  v4 = a3;
  v5 = self;
  SNDirectionOfArrivalResult.encode(with:)((NSCoder)v4);

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)description
{
  SNDirectionOfArrivalResult *v2;
  void *v3;

  v2 = self;
  SNDirectionOfArrivalResult.description.getter();

  v3 = (void *)sub_1D451A6C8();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

@end
