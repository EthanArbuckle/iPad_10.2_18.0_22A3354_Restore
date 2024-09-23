@implementation BloodPressureChartSeries

- ($29D920EB297D915BAF2BF71A1708758A)selectedPathRange
{
  _TtC15HealthRecordsUI24BloodPressureChartSeries *v4;
  __int128 v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  $29D920EB297D915BAF2BF71A1708758A *result;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __n128 v13;
  __n128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __n128 v18;
  __int128 v19;
  __n128 v20;
  __int128 v21;

  v4 = self;
  if (-[HKGraphSeries allowsSelection](v4, sel_allowsSelection))
  {
    HKGraphSeriesDataBlockPathMake((uint64_t)&v14);
    v20 = v14;
    *(_QWORD *)&v21 = v15;
    HKGraphSeriesDataPointPathMake(&v20, &v14);
    v5 = *(_OWORD *)(MEMORY[0x1E0D2F468] + 16);
    v20 = *(__n128 *)MEMORY[0x1E0D2F468];
    v21 = v5;
    v18 = v14;
    v19 = v15;
  }
  else
  {
    v6 = *(_QWORD *)(MEMORY[0x1E0D2F468] + 8);
    v8 = *(_QWORD *)(MEMORY[0x1E0D2F468] + 16);
    v7 = *(_QWORD *)(MEMORY[0x1E0D2F468] + 24);
    v20.n128_u64[0] = *MEMORY[0x1E0D2F468];
    v20.n128_u64[1] = v6;
    *(_QWORD *)&v21 = v8;
    *((_QWORD *)&v21 + 1) = v7;
    v18.n128_u64[0] = v20.n128_u64[0];
    v18.n128_u64[1] = v6;
    *(_QWORD *)&v19 = v8;
    *((_QWORD *)&v19 + 1) = v7;
  }
  HKGraphSeriesDataPointPathRangeMake(&v20, (uint64_t)&v18, &v14);
  v12 = v15;
  v13 = v14;
  v10 = v17;
  v11 = v16;

  *(__n128 *)&retstr->var0.var0.index = v13;
  *(_OWORD *)&retstr->var0.var0.resolution = v12;
  *(_OWORD *)&retstr->var1.var0.index = v11;
  *(_OWORD *)&retstr->var1.var0.resolution = v10;
  return result;
}

- (_TtC15HealthRecordsUI24BloodPressureChartSeries)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for BloodPressureChartSeries();
  return -[HKBloodPressureSeries init](&v3, sel_init);
}

@end
