@implementation SimdFloat4x4Obj

- (SimdFloat4x4Obj)initWithSimdFloat4x4:(double)a3
{
  SimdFloat4x4Obj *v5;
  objc_super v11;

  v11.receiver = a1;
  v11.super_class = (Class)SimdFloat4x4Obj;
  v5 = -[SimdFloat4x4Obj init](&v11, sel_init);
  -[SimdFloat4x4Obj setValue:](v5, "setValue:", a2, a3, a4, a5);
  return v5;
}

- (double)setValue:(__n128)a3
{
  void *v6;
  void *v7;
  void *v8;
  float32x4_t v9;
  uint64_t v10;
  float32x4_t v11;
  int v12;
  int8x16_t v13;
  __n128 v14;
  double result;
  __n128 v16;
  double v17;
  double v18;
  double v19;
  double v20;
  int8x16_t v21;
  int8x16_t v22;
  __n128 v23;
  __n128 v24;
  __n128 v25;
  __n128 v26;

  v23 = a2;
  v24 = a3;
  v25 = a4;
  v26 = a5;
  v17 = a2.n128_f64[0];
  v18 = a3.n128_f64[0];
  v19 = a4.n128_f64[0];
  v20 = a5.n128_f64[0];
  if (+[SimdUtils isSimdFloat4x4Nan:](SimdUtils, "isSimdFloat4x4Nan:"))
  {
    v6 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(MEMORY[0x24BDD17F0], "callStackSymbols");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringWithFormat:", CFSTR("NaN in simd_float4x4 @%@"), v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[HandyLoggerNeo logAtLevel:withPrivacy:withLogArea:inFile:onLine:message:](_TtC5Hands14HandyLoggerNeo, "logAtLevel:withPrivacy:withLogArea:inFile:onLine:message:", 4, 1, CFSTR("Default"), CFSTR("/Library/Caches/com.apple.xbs/Sources/Hands/HandsKit/HandsKitData/HandsKitIO/SimdObjects.mm"), 73, v8);

    +[SimdUtils printSimdFloat4x4:](SimdUtils, "printSimdFloat4x4:", v17, v18, v19, v20);
    v10 = 0;
    v11.i32[0] = 0;
    do
    {
      v12 = 0;
      v13 = *((int8x16_t *)&v23 + v10);
      do
      {
        v22 = v13;
        v9.i32[0] = *(_DWORD *)((unint64_t)&v22 & 0xFFFFFFFFFFFFFFF3 | (4 * (v12 & 3)));
        v9 = (float32x4_t)vdupq_lane_s32((int32x2_t)*(_OWORD *)&vmvnq_s8(vorrq_s8((int8x16_t)vcgtq_f32(v11, v9), (int8x16_t)vcgeq_f32(v9, v11))), 0);
        v21 = v13;
        *(_DWORD *)((unint64_t)&v21 & 0xFFFFFFFFFFFFFFF3 | (4 * (v12 & 3))) = 0;
        v13 = vbslq_s8((int8x16_t)v9, v21, v13);
        ++v12;
      }
      while (v12 != 4);
      *(&v23 + v10++) = (__n128)v13;
    }
    while (v10 != 4);
  }
  v14 = v24;
  a1[1] = v23;
  a1[2] = v14;
  result = v25.n128_f64[0];
  v16 = v26;
  a1[3] = v25;
  a1[4] = v16;
  return result;
}

- (__n128)value
{
  return a1[1];
}

- (NSArray)valueArray
{
  void *v3;
  int v4;
  SimdFloat4x4Obj *v5;
  void *v6;
  double v7;
  uint64_t i;
  void *v9;
  void *v10;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 0;
  v5 = self + 1;
  do
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    for (i = 0; i != 4; ++i)
    {
      LODWORD(v7) = *((_DWORD *)&v5[i].super.isa + (v4 & 3));
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "addObject:", v9);

    }
    objc_msgSend(v3, "addObject:", v6);

    ++v4;
  }
  while (v4 != 4);
  v10 = (void *)objc_msgSend(v3, "copy");

  return (NSArray *)v10;
}

- (BOOL)isEqual:(id)a3
{
  SimdFloat4x4Obj *v4;
  SimdFloat4x4Obj *v5;
  float32x4_t v6;
  float32x4_t v7;
  float32x4_t v8;
  float32x4_t v9;
  float32x4_t v10;
  float32x4_t v11;
  float32x4_t v12;
  float32x4_t v13;
  unsigned int v14;
  float32x4_t v16;
  float32x4_t v17;
  float32x4_t v18;
  float32x4_t v19;

  v4 = (SimdFloat4x4Obj *)a3;
  if (self == v4)
  {
    LOBYTE(v14) = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[SimdFloat4x4Obj value](self, "value");
      v16 = v7;
      v17 = v6;
      v18 = v9;
      v19 = v8;
      -[SimdFloat4x4Obj value](v5, "value");
      v14 = vminvq_u32((uint32x4_t)vandq_s8(vandq_s8((int8x16_t)vceqq_f32(v17, v10), (int8x16_t)vceqq_f32(v16, v11)), vandq_s8((int8x16_t)vceqq_f32(v19, v12), (int8x16_t)vceqq_f32(v18, v13)))) >> 31;

    }
    else
    {
      LOBYTE(v14) = 0;
    }
  }

  return v14;
}

@end
