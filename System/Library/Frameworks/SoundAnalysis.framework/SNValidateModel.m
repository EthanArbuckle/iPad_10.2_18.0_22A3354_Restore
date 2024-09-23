@implementation SNValidateModel

+ (BOOL)ensureFeatureWithDescription:(id)a3 isOptional:(BOOL)a4 error:(id *)a5
{
  id v6;

  v6 = a3;
  sub_1D443E830(v6, a4);

  return 1;
}

+ (BOOL)ensureMultiArrayShapeConstraint:(id)a3 hasDimensionSizeRanges:(id)a4 error:(id *)a5
{
  unint64_t v6;
  id v7;

  sub_1D42E9D88(0, (unint64_t *)&qword_1EFE47310);
  v6 = sub_1D451A92C();
  v7 = a3;
  sub_1D443E990(v7, v6);
  swift_bridgeObjectRelease();

  return 1;
}

+ (BOOL)ensureMultiArrayShapeConstraint:(id)a3 hasShapeOptions:(id)a4 error:(id *)a5
{
  id v6;
  id v7;

  v6 = a3;
  v7 = a4;
  sub_1D443EDC4(v6, v7);

  return 1;
}

+ (BOOL)ensureMultiArrayIsFreelyShapedByShapeConstraint:(id)a3 error:(id *)a4
{
  BOOL result;

  sub_1D443F140((uint64_t)a1, (uint64_t)a2, a3, (uint64_t)a4, (void (*)(void))sub_1D443EF9C);
  return result;
}

+ (BOOL)ensureMultiArrayConstraint:(id)a3 hasDataType:(int64_t)a4 error:(id *)a5
{
  BOOL result;

  sub_1D443F39C((uint64_t)a1, (uint64_t)a2, a3, a4, (uint64_t)a5, (void (*)(void))sub_1D443F004);
  return result;
}

+ (BOOL)ensureMultiArrayIsRequiredByFeatureDescription:(id)a3 error:(id *)a4
{
  BOOL result;

  sub_1D443F140((uint64_t)a1, (uint64_t)a2, a3, (uint64_t)a4, (void (*)(void))sub_1D443F0D8);
  return result;
}

+ (BOOL)ensureMultiArrayConstraint:(id)a3 hasDataType:(int64_t)a4 andDimensionSizeRanges:(id)a5 error:(id *)a6
{
  return sub_1D443F2A4((uint64_t)a1, (uint64_t)a2, a3, a4, a5, (uint64_t)a6, (void (*)(id, uint64_t, id))sub_1D443F1A4);
}

+ (BOOL)ensureMultiArrayConstraint:(id)a3 hasDataType:(int64_t)a4 andShapeOptions:(id)a5 error:(id *)a6
{
  return sub_1D443F2A4((uint64_t)a1, (uint64_t)a2, a3, a4, a5, (uint64_t)a6, (void (*)(id, uint64_t, id))sub_1D443F244);
}

+ (BOOL)ensureMultiArrayIsFreelyShapedWithConstraint:(id)a3 hasDataType:(int64_t)a4 error:(id *)a5
{
  BOOL result;

  sub_1D443F39C((uint64_t)a1, (uint64_t)a2, a3, a4, (uint64_t)a5, (void (*)(void))sub_1D443F33C);
  return result;
}

+ (BOOL)ensureFeatureWithDescription:(id)a3 isOptional:(BOOL)a4 isMultiArrayWithDataType:(int64_t)a5 dimensionSizeRanges:(id)a6 error:(id *)a7
{
  return sub_1D443F4B8((uint64_t)a1, (uint64_t)a2, a3, a4, a5, a6, (uint64_t)a7, (void (*)(id, uint64_t, uint64_t))sub_1D443F1A4);
}

+ (BOOL)ensureFeatureWithDescription:(id)a3 isOptional:(BOOL)a4 isMultiArrayWithDataType:(int64_t)a5 shapeOptions:(id)a6 error:(id *)a7
{
  return sub_1D443F4B8((uint64_t)a1, (uint64_t)a2, a3, a4, a5, a6, (uint64_t)a7, (void (*)(id, uint64_t, uint64_t))sub_1D443F244);
}

+ (BOOL)ensureFeatureWithDescription:(id)a3 isOptional:(BOOL)a4 isFreelyShapedMultiArrayWithDataType:(int64_t)a5 error:(id *)a6
{
  id v8;

  v8 = a3;
  sub_1D443F564(v8, a4, (void *)a5);

  return 1;
}

+ (BOOL)ensureModelDescription:(id)a3 hasInputFeatureNames:(id)a4 hasOutputFeatureNames:(id)a5 error:(id *)a6
{
  uint64_t v7;
  uint64_t v8;
  id v9;

  v7 = sub_1D451A92C();
  v8 = sub_1D451A92C();
  v9 = a3;
  sub_1D443F664(v9, v7, v8);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return 1;
}

- (SNValidateModel)init
{
  return (SNValidateModel *)sub_1D443F958();
}

@end
