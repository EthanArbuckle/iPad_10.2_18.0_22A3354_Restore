@implementation HKGraphSeriesBlockCoordinateList

+ (id)coordinateListByCombiningSubCoordinates:(id)a3 chartableValueRange:(id)a4
{
  id v5;
  id v6;
  _HKCompoundBlockCoordinateList *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[_HKCompoundBlockCoordinateList initWithSubCoordinates:chartableValueRange:]([_HKCompoundBlockCoordinateList alloc], "initWithSubCoordinates:chartableValueRange:", v6, v5);

  return v7;
}

+ (id)coordinateListWithCoordinates:(id)a3 blockPath:(HKGraphSeriesDataBlockPath *)a4
{
  id v5;
  _HKBaseBlockCoordinateList *v6;
  _HKBaseBlockCoordinateList *v7;
  HKGraphSeriesDataBlockPath v9;

  v5 = a3;
  v6 = [_HKBaseBlockCoordinateList alloc];
  v9 = *a4;
  v7 = -[_HKBaseBlockCoordinateList initWithCoordinates:blockPath:](v6, "initWithCoordinates:blockPath:", v5, &v9);

  return v7;
}

- (void)enumerateCoordinatesWithTransform:(CGAffineTransform *)a3 roundToViewScale:(BOOL)a4 block:(id)a5
{
  __int128 v5;
  _OWORD v6[3];

  v5 = *(_OWORD *)&a3->c;
  v6[0] = *(_OWORD *)&a3->a;
  v6[1] = v5;
  v6[2] = *(_OWORD *)&a3->tx;
  -[HKGraphSeriesBlockCoordinateList _enumerateCoordinatesWithTransform:chartableValueRange:roundToViewScale:block:](self, "_enumerateCoordinatesWithTransform:chartableValueRange:roundToViewScale:block:", v6, 0, a4, a5);
}

- (NSArray)coordinates
{
  NSArray *result;

  OUTLINED_FUNCTION_0_9();
  OUTLINED_FUNCTION_1_6();
  OUTLINED_FUNCTION_2_3();
  return result;
}

- (int64_t)numCoordinates
{
  int64_t result;

  OUTLINED_FUNCTION_0_9();
  OUTLINED_FUNCTION_1_6();
  OUTLINED_FUNCTION_2_3();
  return result;
}

- (HKGraphSeriesDataBlockPath)blockPathStart
{
  _QWORD *v3;
  HKGraphSeriesDataBlockPath *result;

  OUTLINED_FUNCTION_3_8();
  OUTLINED_FUNCTION_1_6();
  *v3 = 0;
  v3[1] = 0;
  v3[2] = 0;
  OUTLINED_FUNCTION_4_3();
  return result;
}

- (HKGraphSeriesDataBlockPath)blockPathEnd
{
  _QWORD *v3;
  HKGraphSeriesDataBlockPath *result;

  OUTLINED_FUNCTION_3_8();
  OUTLINED_FUNCTION_1_6();
  *v3 = 0;
  v3[1] = 0;
  v3[2] = 0;
  OUTLINED_FUNCTION_4_3();
  return result;
}

- (void)_enumerateCoordinatesWithTransform:(CGAffineTransform *)a3 chartableValueRange:(id)a4 roundToViewScale:(BOOL)a5 block:(id)a6
{
  OUTLINED_FUNCTION_0_9();
  NSRequestConcreteImplementation();
}

- (id)firstCoordinateWithTransform:(CGAffineTransform *)a3 roundToViewScale:(BOOL)a4
{
  id result;

  OUTLINED_FUNCTION_0_9();
  OUTLINED_FUNCTION_1_6();
  OUTLINED_FUNCTION_2_3();
  return result;
}

- (id)lastCoordinateWithTransform:(CGAffineTransform *)a3 roundToViewScale:(BOOL)a4
{
  id result;

  OUTLINED_FUNCTION_0_9();
  OUTLINED_FUNCTION_1_6();
  OUTLINED_FUNCTION_2_3();
  return result;
}

- (id)_coordinatesInChartableRange:(id)a3
{
  id result;

  OUTLINED_FUNCTION_0_9();
  OUTLINED_FUNCTION_1_6();
  OUTLINED_FUNCTION_2_3();
  return result;
}

- (int64_t)_numCoordinatesInChartableRange:(id)a3
{
  int64_t result;

  OUTLINED_FUNCTION_0_9();
  OUTLINED_FUNCTION_1_6();
  OUTLINED_FUNCTION_2_3();
  return result;
}

@end
